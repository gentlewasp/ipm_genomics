# /ipm1/shared/software/minimap2/minimap2 -t30 -d cs.canu.mmi ../../CS.contigs.fasta
/ipm1/shared/software/minimap2/minimap2 -t30 -a cs.canu.mmi ../cs.correctedReads.fasta > cs.canu.minimap.sam
/ipm1/shared/software/racon/build/bin/racon -t 40 ../cs.correctedReads.fasta cs.canu.minimap.sam CS.contigs.fasta
