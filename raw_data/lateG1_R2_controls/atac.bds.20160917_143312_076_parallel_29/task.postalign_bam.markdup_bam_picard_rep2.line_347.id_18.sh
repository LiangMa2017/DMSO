#!/bin/bash -e

cd '/srv/gsfs0/projects/kundaje/users/annashch/dmso/lateG1_R2_controls'

# SYS command. line 349

 if [[ -f $(which conda) && $(conda env list | grep bds_atac | wc -l) != "0" ]]; then source activate bds_atac; fi;  export PATH=/home/annashch/bds_atac/.:/home/annashch/bds_atac/modules:/home/annashch/bds_atac/utils:${PATH}:/bin:/usr/bin:/usr/local/bin:${HOME}/.bds; set -o pipefail; STARTTIME=$(date +%s); renice -n 0 $$

# SYS command. line 353

 export _JAVA_OPTIONS="-Xms256M -Xmx4G -XX:ParallelGCThreads=1"

# SYS command. line 354

 export MAX_JAVA_MEM="12G"

# SYS command. line 359

 if [ -f "${PICARDROOT}/picard.jar" ]; then \
		      MARKDUP="${PICARDROOT}/picard.jar MarkDuplicates"; \
		    elif [ -f "${PICARDROOT}/MarkDuplicates.jar" ]; then \
		      MARKDUP="${PICARDROOT}/MarkDuplicates.jar"; \
		    elif [ $(which picard 2> /dev/null | wc -l || echo) == "1" ]; then \
		      MARKDUP="$(ls $(dirname $(which picard))/../share/picard*/MarkDuplicates.jar 2> /dev/null || echo)"; \
		    fi

# SYS command. line 368

 if [ -f "${MARKDUP}" ]; then \
			java -Xmx4G -jar ${MARKDUP} \
				INPUT="/srv/gsfs0/projects/kundaje/users/annashch/dmso/lateG1_R2_controls/out/align/rep2/H9_Fucci_LateG1_R2_C2_S40_L005_R1_001.trim.PE2SE.filt.bam" OUTPUT="/srv/gsfs0/projects/kundaje/users/annashch/dmso/lateG1_R2_controls/out/align/rep2/H9_Fucci_LateG1_R2_C2_S40_L005_R1_001.trim.PE2SE.dupmark.bam" \
				METRICS_FILE="/srv/gsfs0/projects/kundaje/users/annashch/dmso/lateG1_R2_controls/out/qc/rep2/H9_Fucci_LateG1_R2_C2_S40_L005_R1_001.trim.PE2SE.dup.qc" VALIDATION_STRINGENCY=LENIENT \
				ASSUME_SORTED=true REMOVE_DUPLICATES=false; \
		    else \
			picard MarkDuplicates \
				INPUT="/srv/gsfs0/projects/kundaje/users/annashch/dmso/lateG1_R2_controls/out/align/rep2/H9_Fucci_LateG1_R2_C2_S40_L005_R1_001.trim.PE2SE.filt.bam" OUTPUT="/srv/gsfs0/projects/kundaje/users/annashch/dmso/lateG1_R2_controls/out/align/rep2/H9_Fucci_LateG1_R2_C2_S40_L005_R1_001.trim.PE2SE.dupmark.bam" \
				METRICS_FILE="/srv/gsfs0/projects/kundaje/users/annashch/dmso/lateG1_R2_controls/out/qc/rep2/H9_Fucci_LateG1_R2_C2_S40_L005_R1_001.trim.PE2SE.dup.qc" VALIDATION_STRINGENCY=LENIENT \
				ASSUME_SORTED=true REMOVE_DUPLICATES=false; \
			fi

# SYS command. line 380

 TASKTIME=$[$(date +%s)-${STARTTIME}]; if [ ${TASKTIME} -lt 60 ]; then echo "Waiting for $[60-${TASKTIME}] seconds."; sleep $[60-${TASKTIME}]; fi
