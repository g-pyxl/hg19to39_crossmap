#!/bin/bash

# Check if an input file is provided
if [ -z "$1" ]; then
    echo "No input file provided."
    exit 1
fi

# Define the input and output directory
INPUT_FILE=$(basename "$1")
FILE_EXTENSION="${INPUT_FILE##*.}"
FILE_NAME="${INPUT_FILE%.*}"

# Define the output file
OUTPUT_FILE="${FILE_NAME}_hg38.${FILE_EXTENSION}"

# Define the reference file argument
REFERENCE_FILE_ARG=""
if [ "$FILE_EXTENSION" = "vcf" ]; then
    REFERENCE_FILE_ARG="/usr/src/app/hg38.fa"
fi

# Run the docker container, mounting the input directory
docker run --rm -v "$(pwd)":/data seglh_crossmap \
    CrossMap $FILE_EXTENSION /usr/src/app/hg19ToHg38.over.chain.gz /data/"${INPUT_FILE}" $REFERENCE_FILE_ARG /data/"${OUTPUT_FILE}"

echo "Liftover completed: ${OUTPUT_FILE} created in $(pwd)"