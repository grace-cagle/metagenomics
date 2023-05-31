# Assembly and annotation of metagenomics reads from soil samples

Scripts used for analysis of permafrost samples. The workflow included:

1. Running multiassembly 

`assembly_parallel.pbs`

`megahit_parallel.sh`

2. Filtering out short (i.e., less than 1000 bp) contigs

`bioawk -c fastx '{ if(length($seq) > 50) { print ">"$name; print $seq }}' some_seq.fastq`

3. Quality checking with QUAST

`metaquast contigs1 --threads`

4. Annotate the contigs with Prokka

`prokka --outdir functional_annotation_multi --prefix $NAME --norrna --notrna --metagenome final.contigs.fa`
