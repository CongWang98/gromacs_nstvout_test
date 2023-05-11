#!/bin/bash   
#SBATCH -N 1
#SBATCH --output=R-%x.%j.out
#SBATCH --time=96:00:00  
#SBATCH --exclusive

# Production
gmx grompp -f production_wo_nstvout.mdp -o production_wo_nstvout.tpr -c npt.gro -p topol.top
mpirun -np 2 gmx_mpi mdrun -deffnm production_wo_nstvout -v -ntomp 5 -dlb yes -pin on -stepout 20000 -maxh 2


