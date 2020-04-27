#!/bin/bash
# Default values
replication_factor=3
partitions=12

helpFunction()
{
   echo ""
   echo "Usage: $0 -t topic -r replication-factor -p partitions"
   echo -e "\t-t topic name"
   echo -e "\t-r replication-factor"
   echo -e "\t-p number of partitions"
   exit 1 # Exit script after printing help
}

while getopts "t:r:p:" flag;
do
    case "${flag}" in
      t) topic=$OPTARG ;;
      r) replication_factor=$OPTARG ;;
      p) partitions=$OPTARG ;;
      ?) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$topic" ] || [ -z "$replication_factor" ] || [ -z "$partitions" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi
echo "$topic $replication_factor $partitions "
kafka-topics --create --zookeeper localhost:2181 --replication-factor "$replication_factor" --partitions "$partitions" --topic "$topic"