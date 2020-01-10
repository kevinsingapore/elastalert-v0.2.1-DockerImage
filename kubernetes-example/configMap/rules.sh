#!/usr/bin/bash

kubectl -n cj-ops delete configmap elastalert-rules
kubectl -n cj-ops create configmap elastalert-rules --from-file=rules/
