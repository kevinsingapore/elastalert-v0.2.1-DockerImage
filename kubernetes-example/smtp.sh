#!/usr/bin/bash

kubectl -n cj-ops delete configmap elastalert-smtp-auth-file
kubectl -n cj-ops create configmap elastalert-smtp-auth-file --from-file=smtp-auth-file.yaml
