# Scaling-a-horizontal-streaming-application-on-Kubernetes
#### Description
This repo is an example of horizontal scaling for streaming application with Kubernetes.

#### Prequisities
[Install minikube](https://minikube.sigs.k8s.io/docs/start/)

#### Build the image
```shell
$ ./build/remove-image.sh
$ ./build/create-image.sh
```

#### Run the app on Kubernetes and expose it to your browser
1. K8s services of type LoadBalancer can be exposed via minikube tunnel command. It must be run in a separate terminal.
```shell
$ minikube tunnel
```
2. Create Kubernetes deployment and service with type LoadBalancer
```shell
$ kubectl apply -f streaming-deployment.yaml
```
3. Check the external IP tunnel of your service. Your EXTERNAL-IP may differ.
```shell
$ kubectl get svc
NAME                   TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
streaming-deployment   LoadBalancer   10.109.55.248   10.109.55.248 5050:32620/TCP   20s
```
4. Open app in your browser.
```shell
http://YOUR-EXTERNAL-IP:5050
```

#### Add HorizontalPodAutoscaler
1. TO DO
