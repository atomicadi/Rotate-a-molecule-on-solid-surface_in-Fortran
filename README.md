# Rotate-a-molecule-on-solid-surface
To rotate a molecule on a solid surface, at first the center of mass (com) of that moleculed needed to calculate, then the molecular coordinates have to be changed w.r.t. the com, then for rotation, Cz rotation matrix is needed to multiply with the coordinates of the molecule.

1. Here, three codes are used, in the first code, com is calculated and it is subroutined by giving the coordinates of the molecule in the main.f90 code.
2. In the com.f90 code, all the matrix values are printed in a .xyz file and only the com value is printed in .txt file which is used later in the main.f90 code.
3. In the main.f90 code, the coordinates of the solid surface and molecule are shifted w.r.t. com and then a new coordinate.xyz file is generated in a new directory.
4. In this new directory, the rot.f90 file is moved, in which only the coordines of the molecule is multiplyed with the Cz rotation matrix from 1 to 360 degree by 1 degree rotation each time, by converting the degree into radian.
