# Rotate-a-molecule-on-solid-surface
![image alt](https://github.com/atomicadi/Rotate-a-molecule-on-solid-surface_in-Fortran/blob/d832478bfa757631839e903692e115ac0dd57e12/rot_represent.png)
In this project, a molecule (denoted by "M", in the rest of the README) is rotted on the Au (111) surface through fortran programming.\
Herein 3 files are generated (com.f90, main.f90, and rot.90) in which com.90 is the subroutine file which contains the pre requirement calculations (center-of-mass (COM)) to rotate M on surface. For calculating the COM, the formula used is,
<p align="center">


$$
X_{COM} = \frac{\sum_i m_i x_i}{\sum_i m_i}
$$

$$
Y_{COM} = \frac{\sum_i m_i y_i}{\sum_i m_i}
$$

$$
Z_{COM} = \frac{\sum_i m_i z_i}{\sum_i m_i}
$$


</p>

On the other hand, the file main.f90 is the mother file which links the subroutine file and input of user to generate the new coordinate file. Initally, the coordinates of whole system (M on surface) is stored in a matrix format and upon unchanging the coordinates of Au (111) surface, only the coordinates of M is taken into the account to calculate the COM. Then using the values of COM, the whole coordinates is set with respect to the COM by just substracting the COM from the whole system coordinates (generally, put the COM at origin to rotate easily along Z axis) which gives then new coordinate file.

Finally, the file rot.90 which conatins the calculations for rotating the M on Au (111) surface will use the new coordinate file and aftering collecting the the whole geometry as matrix form, it will multiply the C<sub>z</sub> rotation matrix with the coordinates of M by keeping the coordinates of Au (111) unchange to rotate M. For each 1° iteration upto 360°, it will change the degree value to radian and put it into the C<sub>z</sub> rotation matrix and proceed to multiply with the partial matrix of M and generate a output file.
