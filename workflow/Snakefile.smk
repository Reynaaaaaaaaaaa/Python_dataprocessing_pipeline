### setup report ###
configfile: "config/config.yaml"

### load rules ###
include: "rules/getData.smk"

### target rules ###
rule all:
    input:
        "data/input/mm10.2bit"