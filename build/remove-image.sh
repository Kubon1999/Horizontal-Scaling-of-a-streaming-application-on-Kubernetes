#!/bin/env bash

if command -v minikube &> /dev/null; then
  echo "[image] Found minikube, begin removing image."
  minikube image rm streaming-app:latest
fi
