% Servers
server(s1). server(s2). server(s3). server(s4). server(s5). server(s6). server(s7).
server_region(s1, europe).
server_region(s2, us_east).
server_region(s3, asia).
server_region(s4, europe).
server_region(s5, asia).
server_region(s6, us_east).
server_region(s7, europe).

server_capacity(s1, cpu, 64). server_capacity(s1, memory, 256). server_capacity(s1, storage, 700).
server_capacity(s2, cpu, 72). server_capacity(s2, memory, 192). server_capacity(s2, storage, 800).
server_capacity(s3, cpu, 48). server_capacity(s3, memory, 120). server_capacity(s3, storage, 400).
server_capacity(s4, cpu, 56). server_capacity(s4, memory, 256). server_capacity(s4, storage, 900).
server_capacity(s5, cpu, 48). server_capacity(s5, memory, 130). server_capacity(s5, storage, 650).
server_capacity(s6, cpu, 64). server_capacity(s6, memory, 180). server_capacity(s6, storage, 700).
server_capacity(s7, cpu, 60). server_capacity(s7, memory, 150). server_capacity(s7, storage, 500).

server_power(s1, 160). server_power(s2, 210). server_power(s3, 100). server_power(s4, 170).
server_power(s5, 120). server_power(s6, 180). server_power(s7, 140).
cost(s1, 40). cost(s2, 45). cost(s3, 35). cost(s4, 50). cost(s5, 38). cost(s6, 42). cost(s7, 41).

server_status(s1, active). server_status(s2, active). server_status(s3, active). server_status(s4, active). server_status(s5, active). server_status(s6, active). server_status(s7, active).
bandwidth(s1, 1200). bandwidth(s2, 1000). bandwidth(s3, 900). bandwidth(s4, 1100). bandwidth(s5, 950). bandwidth(s6, 1050). bandwidth(s7, 1150).
latency(s1, 6). latency(s2, 7). latency(s3, 10). latency(s4, 5). latency(s5, 9). latency(s6, 8). latency(s7, 7).

% VMs
vm(vm1). vm(vm2). vm(vm3). vm(vm4). vm(vm5). vm(vm6). vm(vm7). vm(vm8). vm(vm9). vm(vm10).
vm(vm11). vm(vm12). vm(vm13). vm(vm14). vm(vm15).

vm_require(vm1, cpu, 10).   vm_require(vm1, memory, 20).   vm_require(vm1, storage, 60).
vm_require(vm2, cpu, 8).    vm_require(vm2, memory, 24).   vm_require(vm2, storage, 50).
vm_require(vm3, cpu, 14).   vm_require(vm3, memory, 28).   vm_require(vm3, storage, 75).
vm_require(vm4, cpu, 15).   vm_require(vm4, memory, 40).   vm_require(vm4, storage, 90).
vm_require(vm5, cpu, 12).   vm_require(vm5, memory, 32).   vm_require(vm5, storage, 80).
vm_require(vm6, cpu, 10).   vm_require(vm6, memory, 25).   vm_require(vm6, storage, 65).
vm_require(vm7, cpu, 9).    vm_require(vm7, memory, 26).   vm_require(vm7, storage, 70).
vm_require(vm8, cpu, 16).   vm_require(vm8, memory, 36).   vm_require(vm8, storage, 85).
vm_require(vm9, cpu, 8).    vm_require(vm9, memory, 18).   vm_require(vm9, storage, 55).
vm_require(vm10, cpu, 7).   vm_require(vm10, memory, 22).  vm_require(vm10, storage, 60).
vm_require(vm11, cpu, 12).  vm_require(vm11, memory, 30).  vm_require(vm11, storage, 80).
vm_require(vm12, cpu, 11).  vm_require(vm12, memory, 34).  vm_require(vm12, storage, 90).
vm_require(vm13, cpu, 14).  vm_require(vm13, memory, 29).  vm_require(vm13, storage, 75).
vm_require(vm14, cpu, 13).  vm_require(vm14, memory, 30).  vm_require(vm14, storage, 65).
vm_require(vm15, cpu, 10).  vm_require(vm15, memory, 20).  vm_require(vm15, storage, 60).

% Affinity / Anti-affinity
vm_affinity(vm1, vm2).
vm_affinity(vm3, vm4).
vm_affinity(vm7, vm8).
vm_anti_affinity(vm5, vm6).
vm_anti_affinity(vm9, vm10).
vm_anti_affinity(vm12, vm13).
vm_anti_affinity(vm14, vm15).

% Priorities
vm_priority(vm1, critical).  vm_priority(vm2, critical).
vm_priority(vm3, regular).   vm_priority(vm4, regular).
vm_priority(vm5, regular).   vm_priority(vm6, regular).
vm_priority(vm7, regular).   vm_priority(vm8, regular).
vm_priority(vm9, critical).  vm_priority(vm10, regular).
vm_priority(vm11, regular).  vm_priority(vm12, critical).
vm_priority(vm13, regular).  vm_priority(vm14, regular).
vm_priority(vm15, regular).

% Ownership
vm_company(vm1, poma).
vm_company(vm2, poma).
vm_company(vm3, poma).
vm_company(vm4, poma).
vm_company(vm5, zora).
vm_company(vm6, zora).
vm_company(vm7, zora).
vm_company(vm8, poma).
vm_company(vm9, oddi).
vm_company(vm10, oddi).
vm_company(vm11, oddi).
vm_company(vm12, poma).
vm_company(vm13, zora).
vm_company(vm14, ramsung).
vm_company(vm15, ramsung).

% Bandwidth & Latency
min_bandwidth(vm1, 700). min_bandwidth(vm2, 700).
min_bandwidth(vm3, 900). min_bandwidth(vm4, 900).
min_bandwidth(vm5, 950). min_bandwidth(vm6, 950).
min_bandwidth(vm7, 800). min_bandwidth(vm8, 800).
min_bandwidth(vm9, 1100). min_bandwidth(vm10, 1100).
min_bandwidth(vm11, 900). min_bandwidth(vm12, 1050).
min_bandwidth(vm13, 950). min_bandwidth(vm14, 1000).
min_bandwidth(vm15, 950).

max_latency(vm1, 8). max_latency(vm2, 7).
max_latency(vm3, 6). max_latency(vm4, 6).
max_latency(vm5, 9). max_latency(vm6, 9).
max_latency(vm7, 10). max_latency(vm8, 10).
max_latency(vm9, 6). max_latency(vm10, 7).
max_latency(vm11, 8). max_latency(vm12, 8).
max_latency(vm13, 7). max_latency(vm14, 7).
max_latency(vm15, 8).

% License costs
license(vm1, 11). license(vm2, 11). license(vm3,9). license(vm4,8).
license(vm5,12). license(vm6,12). license(vm7,7). license(vm8,10).
license(vm9,8). license(vm10,7). license(vm11,10). license(vm12,11).
license(vm13,9). license(vm14,10). license(vm15,12).

% Data locality
data_locality(vm8, europe).
data_locality(vm14, europe).
data_locality(vm15, europe).

% Companies & Packages
company(poma). company(zora). company(oddi). company(ramsung).
company_pack(poma, gold).
company_pack(zora, gold).
company_pack(oddi, silver).
company_pack(ramsung, silver).

package(silver, cpu, 54).  package(silver, memory, 140). package(silver, storage, 300).
package(gold, cpu, 128).   package(gold, memory, 512).  package(gold, storage, 800).


% Maintenance / Power
maintenance(s1, off). maintenance(s2, off). maintenance(s3, off).
maintenance(s4, on). maintenance(s5, off). maintenance(s6, off). maintenance(s7, off).
power_threshold(1050).


%backup inputs
server(backup1). server(backup2). server(backup3).
server_region(backup1, europe).
server_region(backup2, us_east).
server_region(backup3, asia).
server_capacity(backup1, cpu, 16).  server_capacity(backup1, memory, 64).  server_capacity(backup1, storage, 100).
server_capacity(backup2, cpu, 16).  server_capacity(backup2, memory, 64).  server_capacity(backup2, storage, 100).
server_capacity(backup3, cpu, 16).  server_capacity(backup3, memory, 64).  server_capacity(backup3, storage, 100).
server_power(backup1, 30).  server_power(backup2, 30).  server_power(backup3, 30).
cost(backup1, 10). cost(backup2, 10). cost(backup3, 10).
backup_server(backup1). backup_server(backup2). backup_server(backup3).