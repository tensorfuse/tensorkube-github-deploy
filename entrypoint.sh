#!/bin/sh -l

aws eks update-kubeconfig --name tensorkube --region us-east-1 
ls -l
cd $8 

export TENSORKUBE_TOKEN=$9
export TENSORKUBE_SESSION_ID=${10}

if [ -n "$2" ]; then
    if [ -n "$7" ]; then
        tensorkube deploy --gpus $1 --gpu-type $2 --cpu $3 --memory $4 --min-scale $5 --max-scale $6 --env $7 --github-actions
    else
        tensorkube deploy --gpus $1 --gpu-type $2 --cpu $3 --memory $4 --min-scale $5 --max-scale $6 --github-actions
    fi
else
    if [ -n "$7" ]; then
        tensorkube deploy --gpus $1 --cpu $3 --memory $4 --min-scale $5 --max-scale $6 --env $7 --github-actions
    else
        tensorkube deploy --gpus $1 --cpu $3 --memory $4 --min-scale $5 --max-scale $6 --github-actions
    fi
fi
