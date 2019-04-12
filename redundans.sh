#!/bin/bash
hiseq_reads=/ipm1/ljcao/cs.genome/raw.data/cs.2016.pe250
scaffold=/ipm1/ljcao/cs.genome/assembly/canu_byGaoqiang_1.3G
out=/ipm1/ljcao/cs.genome/assembly/canu_byGaoqiang_1.3G/test
/ipm1/shared/software/redundans/redundans.py -t 40 -v -f $scaffold/CS.contigs.fasta -o $out/run1