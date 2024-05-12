program main  !Written by Aditya Barman
       implicit none
       real :: coor_Au(826,3), coor_C(72,3), coor_H(78,3), COM(1,3), x_COM, y_COM, z_COM
       real, dimension(:), allocatable ::  x, y, z
       integer :: i, j, num_atom
       character(len=20), allocatable, dimension(:) :: atom
       character(len=100) :: TPBZ_COM, TPBZ_Rot

       num_atom= 976
      ! Open the input file "Au-111-8*12*1-core-TPBZ.xyz"
      open(unit=10, file= "Au-111-8*12*1-core-TPBZ.xyz")
     
     
     ! Skip the first 2 lines
     do i = 1, 2
        read(10,*)
     end do

    ! Read the coordinates of the Au atom
    do i = 1, 826
      read(10, '(5x, 3F12.6)') coor_Au(i,:)
    end do

    ! Read the coordinates of the hydrogen atom
    do i = 1, 78
      read(10, '(5x, 3F12.6)') coor_H(i,:)
    end do

    ! Read the coordinates of the carbon atoms
    do i = 1, 72
        read(10, '(5x, 3F12.6)') coor_C(i,:)
    end do
    close(unit=10)
 
    !call the subroutine for calculation center of mass
    call calculate_COM (coor_H, coor_C)

    !.txt file is generated in the com.f90 file in which only com is written, open that file
    open(unit=30, file="COM-TPBZ.txt")
    read(30, '(3F12.6)') x_COM, y_COM, z_COM
    close(unit=30)

     ! Open the input file "Au-111-8*12*1-core-TPBZ.xyz" again
     open(unit=10, file= "Au-111-8*12*1-core-TPBZ.xyz")

     ! Skip the first two lines
     do i = 1, 2
        read(10, *)
     end do

    ! Allocate arrays based on the number of atoms
    allocate(atom(num_atom), x(num_atom), y(num_atom), z(num_atom))

    ! Read atomic coordinates from the file
    do i = 1, num_atom
        read(10, '(a2, 3x, 3F12.6)') atom(i), x(i), y(i), z(i)
    end do

    ! Open the output file where the new coordinate wrt com will be written
    open(unit=40, file="Au-111-8-12-1-core-TPBZ-new.xyz")
    write(40, '(i4)') num_atom
    write(40, *) "Au-111-8-12-1-coe-TPBZ_new_coor"
    do i = 1, 826
       write(40, '(a2, 3F12.6)') atom(i), x(i), y(i), z(i)
    end do
    
    do i = 827, num_atom
        write(40, '(a2, 3F12.6)') atom(i), x(i) - x_COM, y(i) - y_COM, z(i) - z_COM 
    end do

   ! deallocate the variables
    deallocate(atom, x, y, z)
    close(unit=10)
    close(unit=30)

     
    ! making directories and moving the files to the respective directories
    call system('mkdir ' // "TPBZ_COM")
    call system('mv ' // 'COM-TPBZ.xyz'  // ' ' // 'TPBZ_COM' // '/')
    call system('mv ' // 'COM-TPBZ.txt'  // ' ' // 'TPBZ_COM' // '/')
    !call system('mv ' // 'com.f90'  // ' ' // 'TPBZ_COM' // '/')
    call system('mv ' // 'com.o'  // ' ' // 'TPBZ_COM' // '/')
    call system('mkdir ' // "TPBZ_Rot")
    call system('mv ' // 'Au-111-8-12-1-core-TPBZ-new.xyz'  // ' ' // 'TPBZ_Rot'  // '/')
     
write(*, *) "new_coor.xyz file is generated successfully by Schrodinger"
end program main
       
         
