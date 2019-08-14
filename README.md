Learn Monitoring on minikube
============================

Deploy Prometheus + Grafana
---------------------------

```
make deploy
```

Accessing Dashboards
--------------------

* Prometheus

```
minikube service prometheus -n monitoring
```

* Grafana

```
minikube service grafana -n monitoring
```

* alertmanager

```
kubectl expose deployment alertmanager --name=alertmanager-nodeport --type=NodePort -n monitoring
minikube service alertmanager-nodeport -n monitoring
```

Updating Prometheus Config & apply immediately
----------------------------------------------

```
make config
```

Installing AlertManager
-----------------------

```
make alert-manager
```

Cleanup
-------

```
make cleanup
```

* Test alert manager by dummy alert

```
curl -H "Content-Type: application/json" -d '[{"status": "firing", "labels":{"alertname":"TestAlert1"}}]' http://192.168.39.142:32126/api/v1/alerts
```

* Cofiguring Gmail

For security you shouldn't use your main Gmail password. Instead rather generate an [app password](https://support.google.com/accounts/answer/185833?hl=en).