#!/bin/bash

#yardstick\yardstick\benchmark\scenarios\networking\nstat.py
set -e
OUTPUT_FILE=nstat.log

# run capacity test
run_capacity()
{
    nstat -z > $OUTPUT_FILE
#    nstat -z
}

# write the result to stdout in json format
output_json()
{
    awk '/IpInReceives/' $OUTPUT_FILE
    awk '/IpInHdrErrors/' $OUTPUT_FILE
    awk '/IpInAddrErrors/' $OUTPUT_FILE
    awk '/IcmpInMsgs/' $OUTPUT_FILE
    awk '/IcmpInErrors/' $OUTPUT_FILE
    awk '/TcpInSegs/' $OUTPUT_FILE
    awk '/TcpInErrs/' $OUTPUT_FILE
    awk '/UdpInDatagrams/' $OUTPUT_FILE
    awk '/UdpInErrors/' $OUTPUT_FILE
}

main()
{
    run_capacity

    output_json
}

main
