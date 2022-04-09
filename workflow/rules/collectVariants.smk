"""
    Script number 4

    This script will make use of freebayes, in order to use freebayes please activate the conda virtual env

    It has multiple inputs combining to one general output
        Input:
            The previously generated files .bam and .bai files of all samples
            The mm10 fasta and indexed version

        output;
            A bundled .vcf file

    Since multiple samples are ran through the process of the pipeline, the freebayes-parallel will be used instead of
    the regular single core freebayes argument.

    The best way to install freebayes for the local (conda) environment is running:
      $ git clone --recursive git://github.com/ekg/freebayes.git

    A tutorial for using freebayes can be found on:
        https://bioinformaticsworkbook.org/dataAnalysis/VariantCalling/freebayes-dnaseq-workflow.html#gsc.tab=0
"""

rule call_variant:
    input:
        mm10fa = "data/fasta/mm10.fa",
        mm10fai = "data/fasta/mm10.fa.fai",
        sbam = "data/bam/sorted_{sample}.bam",

    output: "data/variants/{sample}.vcf"

    conda: config["freebayes"]

    log: "logs/rule4/variant/{sample}.vcf.log"

    benchmark: "benchmarks/rule4/variant/{sample}.vcf.txt"

    message: "Collecting variants from .bam files with mm10 as reference"

    shell: "freebayes-parallel <(fasta_generate_regions.py {input.mm10fai} 100000) 36 -f {input.mm10fa} -b {input.sbam} > {output} 2> {log}"


