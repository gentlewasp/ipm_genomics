/ipm1/shared/software/minimap2/minimap2 -x ava-pb -t30 ../cs.correctedReads.fasta ../cs.correctedReads.fasta  | gzip -1 > reads.paf.gz &
/ipm1/shared/software/miniasm/miniasm -t30 -f ../cs.correctedReads.fasta reads.paf.gz > reads.gfa
/ipm1/shared/software/minimap2/minimap2 -t30 -d cs.miniasm.mmi reads.gfa
cp reads.gfa cs.miniasm.fa
/ipm1/shared/software/minimap2/minimap2 -t30 -a cs.miniasm.mmi ../cs.correctedReads.fasta > cs.miniasm.minimap.sam
/ipm1/shared/software/racon/build/bin/racon -t 40 ../cs.correctedReads.fasta cs.miniasm.minimap.sam cs.miniasm.fa
