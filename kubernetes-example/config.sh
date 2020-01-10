#!/usr/bin/bash

kubectl -n cj-ops delete configmap elastalert-config
kubectl -n cj-ops create configmap elastalert-config --from-file=config.yaml

