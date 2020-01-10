#!/bin/bash

kubectl -n cj-ops create cm timezone --from-file=timezone 
