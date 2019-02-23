echo "### Creating monitoring namespace"
kubectl create namespace monitoring
echo "### Installing Prometheus"
kubectl apply -f prometheus/rbac.yml
kubectl apply -f prometheus/sa.yml
kubectl apply -f prometheus/rbac-b.yml
kubectl create configmap prometheus-config --from-file prometheus-config/prometheus.yml --from-file prometheus-config/alerts.yml -n monitoring
kubectl apply -f prometheus/deployment.yml
kubectl apply -f prometheus/service.yml
echo "### Installing Grafana"
kubectl apply -f grafana/deployment.yml
kubectl apply -f grafana/service.yml
echo "### Installing Node Exporter"
kubectl apply -f node-exporter/