"""
    Script number 0

    This script will gather the remote data that starts the process of the pipeline
"""

### setup ###
from snakemake.io import expand

### config ###
configfile: "config/config.yaml"

### download rule ###
rule download_mm10:
    output: "data/input/mm10.2bit"

    log: "logs/rule0/download/gatherData.log"

    benchmark: "benchmarks/rule0/download/gatherData.txt"

    message: "The missing data is downloading..."

    shell:
        "wget {0} -o {1} >{2} 2>&1".format(config['data_url'], '{output}', '{log}')

# ### structure ###
# samples = ['KO1', 'KO2', 'KO3', 'WT']

## Due to Galaxy not allowing Snakemake to download with wget this is legacy (but i tried)
# rule download_bam:
#     output: "data/input/{samples}.bam"
#
#     shell:
#         "wget https://usegalaxy.org/datasets/bbd44e69cb8906b5f0d2f7c26199fd62/display?to_ext=unsorted.bam"
