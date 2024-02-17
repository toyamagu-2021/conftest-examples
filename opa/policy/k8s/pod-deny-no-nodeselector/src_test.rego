package k8s.pod_deny_no_nodeselector
import future.keywords.in

test_no_nodeselector {
  input := parse_config_file("test_data/deployment-no-nodeselector.yaml")
  count(violation) == 1 with input as input
}

test_nodeselector {
  input := parse_config_file("test_data/deployment-nodeselector.yaml")
  count(violation) == 0 with input as input
}

test_no_nodeselector_cronjob {
  input := parse_config_file("test_data/cronjob-no-nodeselector.yaml")
  count(violation) == 1 with input as input
}

test_nodeselector_cronjob {
  input := parse_config_file("test_data/cronjob-nodeselector.yaml")
  count(violation) == 0 with input as input
}
