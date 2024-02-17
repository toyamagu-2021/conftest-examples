package k8s.container_deny_without_resource_constraints

import data.lib.core
import data.lib.pods

policyID := "P2002"

violation[msg] {
	some container
	pods.containers[container]
	not container_resources_provided_requests(container)

	msg := core.format_with_id(
		sprintf("%s/%s/%s: Container resource request must be specified", [core.kind, core.name, container.name]),
		policyID,
	)
}

warn[msg] {
	some container
	pods.containers[container]
	not container_resources_provided_requests(container)

	msg := core.format_with_id(
		sprintf("%s/%s/%s: Container resource limit should be specified", [core.kind, core.name, container.name]),
		policyID,
	)
}

container_resources_provided_requests(container) {
	container.resources.requests.cpu
	container.resources.requests.memory
}

container_resources_provided_limits(container) {
	container.resources.limits.cpu
	container.resources.limits.memory
}

