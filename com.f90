subroutine calculate_COM(coor_H, coor_C)
    implicit none
    real :: coor_C(72,3), coor_H(78,3), mat_C(72,3), mat_H(78,3), mass_tot, mass_C, mass_H
    real :: COM_C(72,3),  COM_H(78,3), COM_C_2(1,3), COM_H_2(1,3),  COM(1,3)
    integer :: i, j
    
    mass_C = 12.011
    mass_H = 1.00784
    
    mass_tot = (72 * mass_C) + (78 * mass_H)  
     
   do i = 1, 72
      do j = 1,3
         mat_C(i,j) = coor_C(i,j) * mass_C
      end do
   end do
    
    do i = 1, 78
       do j = 1,3 
        mat_H(i,j) = coor_H(i,j) * mass_H
       end do
    end do

    do i = 1, 72
      do j = 1,3
         COM_C(i,j) = mat_C(i,j) / mass_tot
      end do
   end do

   do i = 1, 78
       do j = 1,3
        COM_H(i,j) = mat_H(i,j) / mass_tot
       end do
    end do

  !initial value of COM_C_2
    COM_C_2(1,:) = 0.0
 
   do i = 1, 72
     do j =1, 3
      COM_C_2 (1,j) = COM_C_2(1,j) + COM_C(i,j)
    end do
  end do

  !initial value of COM_H_2
    COM_H_2(1,:) = 0.0

   do i = 1, 78
      do j = 1, 3
       COM_H_2 (1,j) = COM_H_2(1,j) + COM_H(i,j)
     end do
  end do

   do i = 1,1
      do j = 1,3
      COM(i,j) = COM_C_2(i,j) + COM_H_2(i,j)
      end do
   end do

    open(unit=20, file= "COM-TPBZ.xyz", status="replace")

    write(20,*) "coor_C "
    do i= 1, 72
      write(20, '(3F12.6)') coor_C(i,:)
    end do

    write(20,*) "coor_H "    
    do i= 1,78
      write(20, '(3F12.6)') coor_H(i,:)
    end do
     
  write(20,*) "mat_C "    
   do i= 1,72
      write(20, '(3F12.6)') mat_C(i,:)
    end do

  write(20,*) "mat_H "    
   do i= 1,78
      write(20, '(3F12.6)') mat_H(i,:)
    end do
 
   write(20,*) "COM_C"
   do i= 1,72
      write(20, '(3F12.6)') COM_C(i,:)
    end do
     
   write(20,*) "COM_H"
   do i= 1,78
      write(20, '(3F12.6)') COM_H(i,:)
    end do

 write(20,*) "COM"
 do i= 1,1
      write(20, '(3F12.6)') COM(i,:)
 end do
 close(unit=20)

 open(unit=30, file="COM-TPBZ.txt")
 do i=1,1
   write(30, '(3F12.6)') COM(i,:)
 end do
 close(unit=30)

write(*, *) " COM.xyz and COM.txt files are generated successfully by Schrodinger."
 
end subroutine calculate_COM
