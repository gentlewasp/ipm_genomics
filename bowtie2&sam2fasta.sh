##1. 启动py3环境
##source activate py3
##2. 运行bowtie2.wol.sh
##time nohup sh bowtie2.wol.sh > log1 &

samples=\../1_indi_sort/samples
list="BJYQ27 HBYC11 HBYC13 HBYC15 HBYC16 HBYC17 HBYC18 HBYC19 HBYC20 HBYC21 HBYC22 HBYC23 HBYC24 HBYC25 HBYC26 HBYC27 HBYC28 HBYC29"
for i in $list
        do
bowtie2 -p 10 --ma 2 --mp 6,2 --np 1 --gbar 4 --rdg 5,5 --rfg 5,5 --local -D 20 -R 3 -N 0 -L 20 -i S,1,0.50 --no-unal -x ./wol_complete -1 $samples/"$i".1.fq.gz -2 $samples/"$i".2.fq.gz -U $samples/"$i".rem.1.fq.gz,$samples/"$i".rem.2.fq.gz -S ./mapping/"$i".sam
done

for i in $list
 do
samtools fasta ./mapping/"$i".sam > ./fasta/"$i".fasta
done

for i in $list
 do
fastx_collapser -v -i ./fasta/"$i".fasta -o ./fasta/"$i".filter.fasta
done
