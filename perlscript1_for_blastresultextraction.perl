#Script 1. FastqExtract.pl – extract paired FASTQ reads based on BLAST output (i.e. filter FASTQ file using BLAST results).
#Use concatenated BLAST results (tabular format) from R1 and R2 to run the script twice, once for each.

print "what is the name of the BLAST output file?\n";
$blastIn = <STDIN>;
chomp $blastIn;
print "what is the name of the raw reads file?\n";
$filename = <STDIN>;
chomp $filename;
print "what is the read identifier (first 6 header characters, not inc @)?\n";
$idf = <STDIN>;
chomp $idf;

#INPUT:
$fastq = $filename;
open(FASTQ, "<$fastq") or print "could not open file1 $fastq";

#HEADERS:
$headers = $blastIn;
chomp $headers;
open(HEADERS, "$headers") or print "could not open file2 $headers";
@headers = <HEADERS>;
close HEADERS;
foreach $head(@headers){
if($head =~ m/\w/){
@head = split(" ", $head);

#add to hash
$headers{$head[0]}=1}
}
$outfile = "$fastq\.out";
open(OUTFILE, ">$outfile") or print "could not open file3 $outfile";

########################################
open(FASTQ, "<$fastq");
while(<FASTQ>){
$line = $_;
if($flag == 1){$flag = 2; print OUTFILE $line;}
elsif($flag == 2){$flag = 3; print OUTFILE $line;}
elsif($flag == 3){$flag = 0; print OUTFILE $line;}
elsif($line =~ m/$idf:/){
@line = split(" ", $line);
$line[0] =~ s/\@//ig;
if(exists $headers{$line[0]}){
++$counter; $flag = 1;
print "$counter\:\t\t$line";
print OUTFILE "$line";
}
}
}
close OUTFILE;
