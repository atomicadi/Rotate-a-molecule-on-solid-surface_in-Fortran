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
