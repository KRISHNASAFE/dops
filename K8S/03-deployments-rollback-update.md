 # Kubernetes Deployment
 A Deployment manages a set of Pods to run an application workload, usually one that doesn't maintain state.
 A Deployment provides declarative updates for Pods and ReplicaSets.

 # Deployment strategy 
 A Kubernetes Deployment is a declarative statement usually configured in a YAML file that defines the application lifecycle and how updates to that application should be applied.
 Deployment strategies control the behavior of Pod replacement when a new version of an application is released to ensure availability and minimal disruption. Kubernetes offers eight built-in strategies to manage how and when old Pods are replaced with new ones during updates. Each strategy addresses different business needs: high availability, risk mitigation, or testing. 
 For example, RollingUpdate is ideal for production services requiring continuous uptime.

# Types of Kubernetes Deployment Strategies
When deploying your applications to a K8s cluster, your chosen deployment strategy will determine how those applications are updated to a newer version from an older one. 
Some strategies will involve downtime. Some will introduce testing concepts and enable user analysis. There are two basic commonly used K8s deployment strategies we will look at in this post:

Recreate: Shuts down all existing Pods before starting new ones. Simple but causes downtime
Rolling Update (default): Gradually replaces old Pods with new ones, minimizing downtime
The following strategies are considered “Advanced deployment strategies” because the flow of traffic can be controlled in various ways:

Blue/Green: Deploys a new version (green) alongside the current (blue), then switches traffic once stable
Canary: Sends a small percentage of traffic to the new version, gradually increasing after validation
A/B Testing: Routes traffic to different versions based on specific user segments or rules
Ramped Slow Rollout: Slowly increases the number of Pods with the new version over time
Shadow Deployment: Clones live traffic to a new version for testing without affecting users
Best-Effort Controlled Rollout: Attempts gradual rollout with intelligent backoff or analysis. 
It is not natively built into Kubernetes, but can be orchestrated using tools like Argo Rollouts or Flagger with metrics-based decision-making.

The default deployment strategy in Kubernetes is RollingUpdate. For workloads requiring zero downtime and version control, RollingUpdate is the most suitable default approach. 
However, there are certain use cases when this may not be appropriate.
















