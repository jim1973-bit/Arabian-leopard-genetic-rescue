#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=USERNAME
#SBATCH -p NODE
#SBATCH --mem=10G
#SBATCH --time=7-00:00
#SBATCH -a 1-100%100
#SBATCH --job-name=SLiM
#SBATCH -o SLiM-%A_%a.out
#SBATCH -e SLiM-%A_%a.err

#ABOVE THIS LINE ARE THE SLURM DIRECTIVES
#BELOW THIS LINE ARE THE COMMANDS TO RUN YOUR JOB

s=(4 94 90 25 28 24 31 75 77 50 56 9 17 10 67 69 65 1 2 3 5 6 7 8 11 12 13 14 15 16 18 19 20 21 22 23 26 27 29 30 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 51 52 53 54 55 57 58 59 60 61 62 63 64 66 68 70 71 72 73 74 76 78 79 80 81 82 83 84 85 86 87 88 89 91 92 93 95 96 97 98 99 100)

s_idx=0

echo ${SLURM_ARRAY_TASK_ID}

idx=0
			for i in ${s[@]}; do
                		((s_idx=s_idx+1))
										if [ $s_idx -eq ${#s[@]} ];
										then
										((s_idx=0))
										fi
                		((idx=idx+1))
                		if [ $idx -eq ${SLURM_ARRAY_TASK_ID} ];
                		then
                		echo stopping at $idx
                		break 1
                		fi

			done


s_val=${s[$s_idx]}

echo Indices
echo $s_idx
echo "Values used"
echo $s_val

module add slim/3.5
slim -s $s_val -d wg_rho=1e-08 -d bg_rho=1e-03 -d g=1000 -d geneLength=1500 -d autoNo=9 -d mu=2.4e-08 -d RlsdInds=2 SLiM_File.slim
