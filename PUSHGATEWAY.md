### Push Gateway




### Case

* repo1

```
cat <<EOF | curl --data-binary @- http://172.17.0.2:30641/metrics/job/deploy_counter/instance/test
# TYPE deploy_metric counter
deploy_to_production{repo="test", buildID="12"} 1
EOF
```


* and repo1

```
cat <<EOF | curl --data-binary @- http://172.17.0.2:30641/metrics/job/deploy_counter/instance/test2
# TYPE deploy_metric counter
deploy_to_production{repo="test", buildID="8"} 1
EOF
```

* repo2

```
cat <<EOF | curl --data-binary @- http://172.17.0.2:30641/metrics/job/deploy_counter/instance/test3
# TYPE deploy_metric counter
deploy_to_production{repo="test1", buildID="12"} 1
EOF
```


* and repo2

```
cat <<EOF | curl --data-binary @- http://172.17.0.2:30641/metrics/job/deploy_counter/instance/test4
# TYPE deploy_metric counter
deploy_to_production{repo="test1", buildID="8"} 1
EOF
```


Query repo1

```
sum(deploy_to_production{repo="test1"})
```

Query repo2

```
sum(deploy_to_production{repo="test2"})
```