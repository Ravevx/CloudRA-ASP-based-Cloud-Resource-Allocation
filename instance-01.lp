% Servers
server(s1). server(s2). server(s3). server(s4). server(s5).

server_region(s1, europe).
server_region(s2, us_east).
server_region(s3, asia).
server_region(s4, europe).
server_region(s5, us_east).

server_capacity(s1, cpu, 48).   server_capacity(s1, memory, 128).   server_capacity(s1, storage, 400).
server_capacity(s2, cpu, 64).   server_capacity(s2, memory, 256).   server_capacity(s2, storage, 900).
server_capacity(s3, cpu, 32).   server_capacity(s3, memory, 96).    server_capacity(s3, storage, 250).
server_capacity(s4, cpu, 24).   server_capacity(s4, memory, 48).    server_capacity(s4, storage, 250).
server_capacity(s5, cpu, 36).   server_capacity(s5, memory, 96).    server_capacity(s5, storage, 300).

server_power(s1, 120). server_power(s2, 200). server_power(s3, 100). server_power(s4, 80). server_power(s5, 110).
server_status(s1, active). server_status(s2, active). server_status(s3, active). server_status(s4, active). server_status(s5, active).
cost(s1, 20). cost(s2, 40). cost(s3, 18). cost(s4, 13). cost(s5, 19).

bandwidth(s1, 800).  bandwidth(s2, 1200). bandwidth(s3, 600). bandwidth(s4, 650). bandwidth(s5, 900).
latency(s1, 8). latency(s2, 5). latency(s3, 11). latency(s4, 7). latency(s5, 6).

% VMs
vm(vm1). vm(vm2). vm(vm3). vm(vm4). vm(vm5). vm(vm6). vm(vm7).

vm_require(vm1, cpu, 10).  vm_require(vm1, memory, 24).  vm_require(vm1, storage, 80).
vm_require(vm2, cpu, 12).  vm_require(vm2, memory, 36).  vm_require(vm2, storage, 100).
vm_require(vm3, cpu, 6).   vm_require(vm3, memory, 18).  vm_require(vm3, storage, 60).
vm_require(vm4, cpu, 8).   vm_require(vm4, memory, 28).  vm_require(vm4, storage, 75).
vm_require(vm5, cpu, 14).  vm_require(vm5, memory, 48).  vm_require(vm5, storage, 90).
vm_require(vm6, cpu, 9).   vm_require(vm6, memory, 20).  vm_require(vm6, storage, 90).
vm_require(vm7, cpu, 5).   vm_require(vm7, memory, 14).  vm_require(vm7, storage, 45).

%Affinity & Anti-affinity
vm_affinity(vm1, vm2).
vm_affinity(vm3, vm4).
vm_anti_affinity(vm5, vm6).

% Priorities
vm_priority(vm1, critical).
vm_priority(vm2, regular).
vm_priority(vm3, critical).
vm_priority(vm4, regular).
vm_priority(vm5, regular).
vm_priority(vm6, regular).
vm_priority(vm7, critical).

%Ownership
vm_company(vm1, closeai).
vm_company(vm2, closeai).
vm_company(vm3, ghemini).
vm_company(vm4, ghemini).
vm_company(vm5, pineapple).
vm_company(vm6, pineapple).
vm_company(vm7, closeai).

% QoS
min_bandwidth(vm1, 500).
min_bandwidth(vm2, 400).
min_bandwidth(vm3, 600).
min_bandwidth(vm4, 650).
min_bandwidth(vm5, 750).
min_bandwidth(vm6, 700).
min_bandwidth(vm7, 800).

max_latency(vm1, 10).
max_latency(vm2, 12).
max_latency(vm3, 9).
max_latency(vm4, 10).
max_latency(vm5, 8).
max_latency(vm6, 10).
max_latency(vm7, 9).

% License costs
license(vm1, 12).
license(vm2, 10).
license(vm3, 8).
license(vm4, 7).
license(vm5, 16).
license(vm6, 9).
license(vm7, 10).

%Data locality
data_locality(vm7, europe).
data_locality(vm6, us_east).

% Companies & Packages
company(closeai). company(ghemini). company(pineapple).
company_pack(closeai, gold).
company_pack(ghemini, silver).
company_pack(pineapple, silver).
package(silver, cpu, 32).  package(silver, memory, 100).  package(silver, storage, 180).
package(gold, cpu, 64).    package(gold, memory, 220).   package(gold, storage, 400).

% SLA Reservation
sla_reservation(critical, cpu, 20).

% Maintenance / Power
maintenance(s1, off). maintenance(s2, off). maintenance(s3, off). maintenance(s4, off). maintenance(s5, off).
power_threshold(500).

%backup inputs
server(backup1).
server_region(backup1, europe).

server_capacity(backup1, cpu, 0).  server_capacity(backup1, memory, 0).  server_capacity(backup1, storage, 0).

server_power(backup1, 30). 
cost(backup1, 10). 
backup_server(backup1).