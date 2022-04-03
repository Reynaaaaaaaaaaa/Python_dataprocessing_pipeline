"""
    This script will gather the remote data that starts the process of the pipeline
"""
### config ###
configfile: "config/config.yaml"

### structure ###
samples = ['1', '2', '3']

### download rule ###
rule download_mm10:
    output: "data/input/mm10.2bit"

    log: "logs/gatherData.log"

    shell:
        "wget {0} -o {1} >{2} 2>&1".format(config['data_url'], '{output}', '{log}')

## Due to Galaxy not allowing Snakemake to download with wget this is legacy (but i tried)
# rule download_bam:
#     output: "data/input/{samples}.bam"
#
#     shell:
#         "wget https://usegalaxy.org/datasets/bbd44e69cb8906b5f0d2f7c26199fd62/display?to_ext=unsorted.bam"
