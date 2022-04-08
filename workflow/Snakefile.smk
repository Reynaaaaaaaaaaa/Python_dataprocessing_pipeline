"""
    Main control of the pipeline

    All the samples go through a path and the mm10 is handled in process fasta
      user downloads bam -> processBam -> collect variants -> filter vcf -> gather primitives -> preprocess intersection
              getData -> processFasta -^

                              -> KO merged           -v
    preprocess intersection -|                         intersect vcf -> plot result
                              -> primitive wild type -^

"""

configfile: "config/config.yaml"

### load rules ###
include: "rules/getData.smk"
include: "rules/processBam.smk"
include: "rules/processFasta.smk"
include: "rules/collectVariants.smk"
include: "rules/filterVcf.smk"
include: "rules/gatherPrimitives.smk"
include: "rules/preprocessIntersection.smk"
include: "rules/intersectVcf.smk"
include: "rules/plotResult.smk"

### target rules ###
rule all:
    input: "result/out.pdf"