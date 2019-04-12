###install
#conda create -n purge_haplotigs_env
#source activate purge_haplotigs_env
#conda install purge_haplotigs
#purge_haplotigs test

###input data, draft genome and subreads of PacBio
subreads=/ipm1/chenmingzhu/px.genome/raw_data/px.pacbio.fa
genome=/ipm1/chenmingzhu/px.genome/assembly/canu1.8_wtdbg01/px.0.12/pergeHaplogs/px.genome.pilon1.fa

###mapping
minimap2 -ax map-pb ${genome} ${subreads}\
    | samtools view -hF 256 - \
    | samtools sort -@ 80 -m 1G -o aligned.bam -T tmp.ali
###analysis sequencing depth from bam files, and obtain -l -m -h parameters for next step
purge_haplotigs readhist -b aligned.bam -g ${genome} -t 20

###obtain coverage_stats.csv
purge_haplotigs  contigcov  -i aligned.bam.gencov  -o coverage_stats.csv  -l 20  -m 75  -h 190

###detect haplotigs and re-assembly
purge_haplotigs purge  -g ${genome}  -c coverage_stats.csv  -b aligned.bam  -t 80  -a 60
