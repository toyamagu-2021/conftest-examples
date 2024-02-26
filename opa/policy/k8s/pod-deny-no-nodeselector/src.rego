package k8s.pod_deny_no_nodeselector
import future.keywords.in

violation[msg] {
	input.kind in ["Deployment", "StatefulSet", "Job"]
	not input.spec.template.spec.nodeSelector
	msg := sprintf("nodeSelector is not found of `%v` `%v`", [input.kind, input.metadata.name])
}

violation[msg] {
	input.kind in ["CronJob"]
	not input.spec.jobTemplate.spec.template.spec.nodeSelector
	msg := sprintf("nodeSelector is not found of `%v` `%v`", [input.kind, input.metadata.name])
}

violation[msg] {
	input.kind in ["Deployment", "StatefulSet", "Job"]
	spec := input.spec.template.spec
	nodeSelector := object.remove(spec.nodeSelector, ["ddApmEnabled"])
	nodeSelector == {}
	msg := sprintf("set other than ddApmEnabled of `%v` `%v`", [input.kind, input.metadata.name])
}

violation[msg] {
	input.kind in ["CronJob"]
	spec := input.spec.jobTemplate.spec.template.spec
	nodeSelector := object.remove(spec.nodeSelector, ["ddApmEnabled"])
	nodeSelector == {}
	msg := sprintf("set other than ddApmEnabled of `%v` `%v`", [input.kind, input.metadata.name])
}
