#!/bin/env bash

if command -v minikube &> /dev/null; then
  echo "[image] Found minikube, begin creating image."
  cd app
  minikube image build -t streaming-app:latest .
fi
