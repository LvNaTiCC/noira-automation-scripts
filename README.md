# Noira Virtual Infrastracture

This specification is, until specificially mentioned, a wishlist of sorts. A vision of what a private cloud for a private person, specificially an engineer wanting to host their services, practice skills in a near-production environment could be like. Noira is intended to be a perfect playground with all critical pieces in place for developing, testing, learning and hosting infrastructure software or otherwisely networked apps. Nothing stops anyone from running desktop software there, though. 

## Hardware assumptions

* Hetzner vSwitch with a VLAN ID (Will be made optional in the future) 
* 3 or more hardware servers with 2TB or more NVME Storage (Will be made configurable in the future)
* 1GBps uplink, upstream VLAN for internal communication (Specialized segregation based on NICs for storage and interconnect networks are planned) 

## Software Stack

1. Proxmox Virtual Environment as first-class Hypervisor. #DONE
2. K8s on top of PVE VMs with Longhorn for stateful VMs
4. Local storage based on ZFS for most VMs #DONE
5. Linstor storage for critical, non-write-intensive VMs for quick recovery time during failure
6. Mikrotik CHR Router for inter-vm communication and edge traffic control

## Networking Stack

Network is built around several crucial pieces.

For controlling edge traffic, DNAT/SNAT is used on hypervisors, forwarding a range of ports (80,443,60000-62000 by default, subject to change) to a virtual router (based on Mikrotik CHR). This configuration is supposed to stay immutable and not a subject to change (as for services as cattle principle). #TODO

This virtual router is the one making decisions about what goes where and is the main configuration mutation point. The way network segmentation is built, is by creating bridges layered over VXVLAN on existing IP fabric. Those bridges are then attached to the CHR router for per-port network segment configuration. #TODO

This router, being a single point of failure for the whole vm interconnect, will have a slice of Linstor storage pool. It will not perform much storage writes/reads, so it is alright to put it in linstor. #TODO

The exact topology should be described using a GNS3 diagram. #TODO

## Observability

For monitoring, classic prometheus + grafana will be used, on top of k8s with exporters reporting from PVE nodes and k8s cluster, as well as chr router.  #TODO

For a nice status page, Uptime Kuma will be used, on top of k8s. To make sure uptime kuma gets an external look, a proxy to an unrelated VPS is advised.  #TODO

## User AC and hardening

No linux VM or otherwise should be ever be accessible from the internet without a proper AES256 ssh key. Services that allow login wia browser must be either well-hardened according to their documentation, or, if impossible, reasonably restricted by IP whitelist or other kind of secure authentication. Proxmox Web UI should not be accessible from the internet and should only be accessed using a terminal server either via xrdp or ssh tunneling passthrough.

Root user account should be disabled for all internet-facing vms (including bastions), including potentially vulnerable web service.

Bastion VMs should be both AES256 ssh key protected and IP whitelisted.

## Principles 

1. Zero to hero. All base infrastructure should be deployable without any manual intervention required. The goal is to have the system that is once properly described via variables, can be deployed with a single click or a command.
2. Services as cattle when applicable. Bare metal infrastracture should be kept pristine.
3. Resilience. If possible, there should be no single point of failure inside the configuration, which is backed by multiple hardware nodes and separate network uplinks. Services that are hosted on bare metal should in no way, shape or form depend on services hosted inside VMs.
4. High Availability. When possible, failover speed of critical services should be minimal.
5. No circular dependencies, infrastructure should be built like a pyramid.

## Having Fun

Branded images should be replaced with something nice looking, maybe even with some CSS changed, for extra flair. Not to subtract from original products work, just to have some flair inside an otherwise sterile homelab. Those tweaks will be done in a separate repo. #TODO

