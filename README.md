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


Updating Prometheus Config & apply immediately
----------------------------------------------

```
make config
```

Cleanup
-------

```
make cleanup
```