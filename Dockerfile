# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Install CrossMap
RUN pip install CrossMap

# Copy the chain file and reference genome into the container
COPY hg19ToHg38.over.chain.gz .
COPY hg38.fa .
COPY hg38.fa.fai .