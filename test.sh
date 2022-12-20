#!/bin/env bash

# Run this in seperate terminal, ctrl+C to terminate
kubectl run -i --tty -n uiam load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.001; do wget -q -O- http://streaming-app:8000; done"
