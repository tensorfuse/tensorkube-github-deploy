#!/bin/sh -l

aws eks update-kubeconfig --name tensorkube --region us-east-1 

export CLUSTER_VERSION=$(kubectl get configmap tensorkube-migration -n default -o jsonpath='{.data.version}')
if [ "$(printf '%s\n' "$CLUSTER_VERSION" "0.0.40" | sort -V | head -n1)" = "0.0.40" ]; then
    pip3 install tensorkube==$CLUSTER_VERSION
else
    pip3 install tensorkube==0.0.40
fi

cd $8 

export TENSORKUBE_TOKEN=$9
export TENSORKUBE_SESSION_ID=${10}

secrets=$(echo ${11} | tr ' ' '\n')

# Create a string with the --secret flag for each secret
secrets_flags=""
for secret in $secrets; do
    secrets_flags="$secrets_flags --secret $secret"
done

if [ -n "$2" ]; then
    if [ -n "$7" ]; then
        tensorkube deploy --gpus $1 --gpu-type $2 --cpu $3 --memory $4 --min-scale $5 --max-scale $6 --env $7 --github-actions $secrets_flags
    else
        tensorkube deploy --gpus $1 --gpu-type $2 --cpu $3 --memory $4 --min-scale $5 --max-scale $6 --github-actions $secrets_flags
    fi
else
    if [ -n "$7" ]; then
        tensorkube deploy --gpus $1 --cpu $3 --memory $4 --min-scale $5 --max-scale $6 --env $7 --github-actions $secrets_flags
    else
        tensorkube deploy --gpus $1 --cpu $3 --memory $4 --min-scale $5 --max-scale $6 --github-actions $secrets_flags
    fi
fi
