# Noira Virtual Infrastracture

## Hardware assumptions

* 3 or more hardware servers with 2TB or more NVME Storage
* 1GBps uplink, upstream VLAN for internal communication

## Software Stack

1. KVM with Proxmox.
2. K8s on top of KVM VMs with Longhorn for stateful VMs
4. Local storage based on ZFS for most VMs
5. Linstor storage for critical, non-write-intensive VMs for quick recovery time during failure

## Principles 

1. Zero to hero. All base infrastructure should be deployable without any manual intervention required
2. Services as cattle when applicable. Bare metal infrastracture should be kept pristine.
3. Resilience. If possible, there should be no single point of failure inside the configuration, which is backed by multiple hardware nodes and separate network uplinks.
4. High Availability. When possible, failover speed of critical services should be minimal.
5. No circular dependencies, infrastructure should be built like a pyramid.
