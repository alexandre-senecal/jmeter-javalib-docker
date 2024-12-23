#! /bin/bash
set -e

if [ $# -ne 2 ]; then
    echo "Two parameters are required!"
    echo "   1. The jmx file to run."
    echo "   2. The Docker image."
    exit 1
fi

timestamp=$(date +%Y%m%d_%H%M%S)
jmx_filename=${1##*/}
jmx_report_name=${jmx_filename%.jmx}
report_name=${jmx_report_name}_${timestamp}

mkdir -p ./target/runs

docker run \
   --rm \
   -v ./target/runs:/var/log/jmeter \
   -v ./jmeter:/mnt/jmeter \
   $2 \
   -n -t /mnt/jmeter/$1 \
   -l /var/log/jmeter/${report_name}.jtl \
   -j /var/log/jmeter/${report_name}.log \
   -e -o /var/log/jmeter/${report_name}
