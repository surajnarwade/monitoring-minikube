clean:
	./cleanup.sh

deploy:
	./deploy.sh

config:
	kubectl delete configmap prometheus-config -n monitoring
	kubectl create configmap prometheus-config --from-file prometheus-config/prometheus.yml -n monitoring
	kubectl scale deployment prometheus --replicas=0 -n monitoring
	kubectl scale deployment prometheus --replicas=1 -n monitoring
