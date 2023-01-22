# kubernetes horizontal scaling example
#### Description
This repo is an example of horizontal scaling for streaming application in Kubernetes.

#### Prequisities
[Install minikube](https://minikube.sigs.k8s.io/docs/start/)

#### Download mp4 video and put it in the app directory
In our case we have used a nice [video of earth](https://pixabay.com/videos/world-earth-nasa-planet-globe-2/)  
Once you download your video and put it in the app directory, make sure it is named 'earth.mp4' or update 'index.js' file

#### Build the image
```shell
$ ./build/remove-image.sh
$ ./build/create-image.sh
```

#### Run the app on Kubernetes and expose it to your browser
1. K8s services of type LoadBalancer can be exposed via minikube tunnel command
```shell
# Run this in a separate terminal
$ minikube tunnel
```
2. Create Kubernetes deployment and service with type LoadBalancer
```shell
$ kubectl apply -f app-deployment.yaml
```
3. Check the external IP tunnel of your service
```shell
# Your EXTERNAL-IP may differ
$ kubectl get svc
NAME                   TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
streaming-deployment   LoadBalancer   10.109.55.248   10.109.55.248 8000:32620/TCP   20s
```
4. Open app in your browser.
```shell
http://YOUR-EXTERNAL-IP:8000
```

#### Add HorizontalPodAutoscaler
1. Enable minikube metrics-server addon
```shell
$ minikube addons enable metrics-server
```
2. Create the HorizontalPodAutoscaler
```shell
$ kubectl apply -f app-autoscaling.yaml
```

#### See how HPA works
1. Increase the load
```shell
$ ./test.sh
```
2. Watch how Horizontal Pod Autoscaler reacts
```shell
$ kubectl get hpa streaming-app -n uiam --watch
```
3. You should get results similar to this
```shell
# Note that default duration of the cooldown delay is 5 minutes
$ kubectl get hpa streaming-app -n uiam --watch
NAME            REFERENCE                  TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
streaming-app   Deployment/streaming-app   2%/50%    1         10        4          44m
streaming-app   Deployment/streaming-app   2%/50%    1         10        5          44m
streaming-app   Deployment/streaming-app   76%/50%   1         10        5          45m
streaming-app   Deployment/streaming-app   76%/50%   1         10        7          45m
streaming-app   Deployment/streaming-app   58%/50%   1         10        7          46m
streaming-app   Deployment/streaming-app   1%/50%    1         10        7          47m
streaming-app   Deployment/streaming-app   0%/50%    1         10        7          48m
streaming-app   Deployment/streaming-app   0%/50%    1         10        7          51m
streaming-app   Deployment/streaming-app   0%/50%    1         10        1          52m
```