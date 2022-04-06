"""
    Main control of the pipeline

    getData -> processBam -> processFasta

"""

configfile: "config/config.yaml"

### load rules ###
include: "rules/getData.smk"
include: "rules/processBam.smk"
include: "rules/processFasta.smk"
include: "rules/collectVariants.smk"

### target rules ###
rule all:
    input: "data/variants/KO2.vcf"