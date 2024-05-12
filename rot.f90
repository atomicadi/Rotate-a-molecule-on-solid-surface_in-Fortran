program rotation !written by Aditya Barman
       implicit none
       real :: coor_Au(826,4),  coor_H_C(150,4), coor_H_C_2(150,3), coor_H_2(78,3), rot_mat(3,3)     
       real :: rot_coor_H_C(150,3), pi, dtor, rot_value 
       integer :: i, j, num_atom, io_status, unit_out
       character(len=100) :: line, output_filename, output_foldername

       num_atom = 976
       pi = 3.1415926535897932d0
       dtor = pi/180

       open(unit=10, file= "Au-111-8-12-1-core-TPBZ-new.xyz")
       do i = 1,2
         read(10,*)
       end do

       do i = 1, 826
          read(10, 100) (coor_Au(i,j), j= 1,4)
       100 format(a2, 2x, 3F12.6)
       end do

       do i = 1, 150
          read(10, 200) (coor_H_C(i,j), j= 1,4)
       200 format(a2, 2x, 3F12.6)
       end do
       close(unit=10)

       open(unit=10, file= "Au-111-8-12-1-core-TPBZ-new.xyz")
       do i = 1, 828
         read(10,*)
       end do
      
       do i = 1, 150
          read(10, 111) (coor_H_C_2(i,j), j= 1,3)
       111 format(4x, 3F12.6)
       end do
       close(unit=10)
       
   do i = 1, 360
         rot_value = i * dtor

         !setting the Cz rotation matrix
         rot_mat = reshape([cos(rot_value), -sin(rot_value), 0.0, &
                            sin(rot_value), cos(rot_value), 0.0, &
                            0.0, 0.0, 1.0],[3,3])

         rot_coor_H_C= matmul(coor_H_C_2, rot_mat)
 
         output_filename= 'rot_' // trim(adjustl(int2str(i))) // '.xyz'
         !output_foldername= 'rot_' // trim(int2str(i))

         open(unit=unit_out, file= output_filename)
         write(unit_out, '(i4)') num_atom
         write(unit_out, *) "Au-111-8-12-1-core-TPBZ-new-rot-coor"
         do j= 1, 826
            write(unit_out, '(a2, 3F12.6)') coor_Au(j,:)
         end do

         do j= 1, 150
            write(unit_out, '(a2, 3F12.6)') coor_H_C(j,1), rot_coor_H_C(j,:)
         end do
         close(unit=unit_out)
    end do
    write(*,*)"files are generated successfully by Schrodinger"

contains
   ! Function to convert integer to string
    function int2str(i) result(s)
        integer, intent(in) :: i
        character(len=10) :: s
        write(s, '(I10)') i
    end function int2str
end program rotation
