"""
    Main control of the pipeline

    getData -> processBam -> processFasta

"""

configfile: "config/config.yaml"

### load rules ###
include: "rules/getData.smk"
include: "rules/processBam.smk"
include: "rules/processFasta.smk"

### target rules ###
rule all:
    input:
        "data/fasta/mm10.fa"

