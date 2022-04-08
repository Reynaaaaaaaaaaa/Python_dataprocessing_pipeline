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
include: "rules/filterVcf.smk"
include: "rules/gatherPrimitives.smk"
include: "rules/intersectVcf.smk"

### target rules ###
rule all:
    input: "data/zips/KO3.vcf.gz"