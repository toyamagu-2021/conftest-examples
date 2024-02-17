# conftest-examples

## Usage

* Pull from konstraint
  * `conftest pull github.com/plexsystems/konstraint/examples/lib -p opa/policy/k8s/lib`
* Test: Validate manifest
  * All namespaces
    * `conftest test test.yaml --policy ./opa/policy/k8s --all-namespaces`
  * Specific namespace
    * `conftest test ./opa/policy/k8s/pod-deny-no-nodeselector/test_data --policy ./opa/policy/k8s --namespace k8s.pod_deny_no_nodeselector`
* Verify: Run test for rego
  * `conftest verify --policy ./opa/policy`

## Useful options

* `--output table`
  * output as table
