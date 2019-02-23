default: all

.PHONY: all
all: kube-state-metrics deploy alert-manager node-exporter

clean:
	./cleanup.sh

.PHONY: deploy
deploy:
	./deploy.sh

.PHONY: alert-manager
alert-manager:
	echo "### Installing alert-manager"
	kubectl create configmap alerting-config -n monitoring --from-file alertmanager-config/alertmanager.yml
	kubectl apply -f alertmanager/

.PHONY: kube-state-metrics
kube-state-metrics:
	echo "### Installing kube state metrics"
	kubectl apply -f kube-state-metrics/

.PHONY: node-exporter
node-exporter:
	kubectl apply -f node-exporter/

.PHONY: prometheus-config
prometheus-config:
	kubectl delete configmap prometheus-config -n monitoring
	kubectl create configmap prometheus-config --from-file prometheus-config/prometheus.yml --from-file prometheus-config/alerts.yml  -n monitoring
	kubectl scale deployment prometheus --replicas=0 -n monitoring
	kubectl scale deployment prometheus --replicas=1 -n monitoring

.PHONY: alert-config
alert-config:
	kubectl delete configmap alerting-config -n monitoring
	kubectl create configmap alerting-config --from-file alertmanager-config/alertmanager.yml -n monitoring
	kubectl scale deployment alertmanager --replicas=0 -n monitoring
	kubectl scale deployment alertmanager --replicas=1 -n monitoring
	
