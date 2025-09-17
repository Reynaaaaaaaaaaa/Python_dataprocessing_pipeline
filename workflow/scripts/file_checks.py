import sys
import os

def check_exists(file_path, desc="file"):
    if not os.path.exists(file_path):
        sys.stderr.write(f"ERROR: Required {desc} not found: {file_path}\n")
        sys.exit(1)
    if os.path.isdir(file_path):
        sys.stderr.write(f"ERROR: Expected {desc} to be a file, but found directory: {file_path}\n")
        sys.exit(1)

def check_nonempty(file_path, desc="file"):
    check_exists(file_path, desc)
    if os.path.getsize(file_path) == 0:
        sys.stderr.write(f"ERROR: {desc} is empty: {file_path}\n")
        sys.exit(1)

def check_bam(file_path):
    check_nonempty(file_path, "BAM file")
    # Optional: Check BAM magic number
    with open(file_path, "rb") as f:
        magic = f.read(4)
        if magic != b'BAM\1':
            sys.stderr.write(f"ERROR: BAM file does not have BAM format magic number: {file_path}\n")
            sys.exit(1)

def check_vcf(file_path):
    check_nonempty(file_path, "VCF file")
    with open(file_path, "r") as f:
        # Check for typical VCF header
        for line in f:
            if line.startswith("##") or line.startswith("#CHROM"):
                return
        sys.stderr.write(f"ERROR: VCF file does not contain expected header: {file_path}\n")
        sys.exit(1)

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Check file existence and format.")
    parser.add_argument("file", help="File to check")
    parser.add_argument("--type", choices=["bam", "vcf", "generic"], default="generic", help="Type of file to check")
    args = parser.parse_args()

    if args.type == "bam":
        check_bam(args.file)
    elif args.type == "vcf":
        check_vcf(args.file)
    else:
        check_nonempty(args.file)