#!/bin/bash

sed -i 's;        image: 593393184947.dkr.ecr.us-east-1.amazonaws.com/vre/accountsdb:\(.*\);        image: 593393184947.dkr.ecr.us-east-1.amazonaws.com/vre/accountsdb:'$1';g' kube/accountsdb/statefulset.yaml