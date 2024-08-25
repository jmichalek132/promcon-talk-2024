Requirements
* k8s cluster
* helm
* kubectl

Setup
* Create k8s cluster
* Install mimir using helm
  * `helm repo add grafana https://grafana.github.io/helm-charts`
  * `helm install mimir grafana/mimir-distributed  --create-namespace --namespace mimir --values infra/helm/mimir/values.yaml`
* Install grafana using helm
  * `helm install grafana grafana/grafana  --create-namespace --namespace grafana --values infra/helm/grafana/values.yaml`