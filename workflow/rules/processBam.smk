"""
    Script number 1

    The first step of the pipeline, the bam files will be sorted and indexed
    This script is based off of: https://github.com/cfarkas/Genotype-variants/blob/master/scripts/sort_bam.sh

    The scripts used for the pipeline cant be downloaded remotely, the four samples can be found:
    https://usegalaxy.org/u/carlosfarkas/h/test-sall2-ko-rna-seq-gse123168-1
"""

### setup ###
from snakemake.io import expand


### config ###
configfile: "config/config.yaml"

rule sort_bam:
    """
        Calls samtools to sort the input and save it in sorted bam
        uses expand samples from config to easily change everything in the config and not in every script
    """
    input: "data/input/{samples}.bam"

    output: "data/bam/sorted_{samples}.bam"

    log: "logs/rule1/sort/{samples}.bam.log"

    message: "Sorting bam files to data/sorted_bam/"

    shell: "samtools sort {input} > {output} -@ 4 2> {log}"


rule index_bam:
    """
        Calls samtools to index the sorted bam files and save them under indexed
    """
    input: "data/bam/sorted_{samples}.bam"

    output: "data/bam/sorted_{samples}.bam.bai"

    log: "logs/rule1/index/{samples}.bam.bai.log"

    message: "Indexing sorted bam files to /data/indexed_bam/"

    shell: "samtools index {input} > {output} 2> {log}"
