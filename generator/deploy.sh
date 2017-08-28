#!/bin/sh

PARAMETERS_FILE=$1
RESOURCE_GROUP=$2

# create generatedTemplate.json
python deployment.py parameters/${PARAMETERS_FILE}.yaml

az group create --name $RESOURCE_GROUP --location westus

az group deployment create \
--template-file @generatedTemplate.json \
--parameters @mainTemplateParameters.json \
--resource-group $RESOURCE_GROUP
