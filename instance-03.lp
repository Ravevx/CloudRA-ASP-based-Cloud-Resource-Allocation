% Servers
server(s1). server(s2). server(s3). server(s4). server(s5). server(s6). server(s7). server(s8).
server_region(s1, europe).
server_region(s2, us_east).
server_region(s3, asia).
server_region(s4, europe).
server_region(s5, asia).
server_region(s6, us_east).
server_region(s7, europe).
server_region(s8, asia).
server_capacity(s1, cpu, 64). server_capacity(s1, memory, 220). server_capacity(s1, storage, 800).
server_capacity(s2, cpu, 72). server_capacity(s2, memory, 224). server_capacity(s2, storage, 950).
server_capacity(s3, cpu, 56). server_capacity(s3, memory, 180). server_capacity(s3, storage, 500).
server_capacity(s4, cpu, 70). server_capacity(s4, memory, 260). server_capacity(s4, storage, 925).
server_capacity(s5, cpu, 50). server_capacity(s5, memory, 150). server_capacity(s5, storage, 600).
server_capacity(s6, cpu, 64). server_capacity(s6, memory, 180). server_capacity(s6, storage, 700).
server_capacity(s7, cpu, 56). server_capacity(s7, memory, 200). server_capacity(s7, storage, 720).
server_capacity(s8, cpu, 60). server_capacity(s8, memory, 160). server_capacity(s8, storage, 510).
server_power(s1, 170). server_power(s2, 210). server_power(s3, 120). server_power(s4, 150).
server_power(s5, 110). server_power(s6, 140). server_power(s7, 130). server_power(s8, 125).
cost(s1, 44). cost(s2, 47). cost(s3, 35). cost(s4, 54). cost(s5, 39). cost(s6, 43). cost(s7, 42). cost(s8, 41).
server_status(s1, active). server_status(s2, active). server_status(s3, active). server_status(s4, active).
server_status(s5, active). server_status(s6, active). server_status(s7, active). server_status(s8, active).
bandwidth(s1, 1200). bandwidth(s2, 1150). bandwidth(s3, 950). bandwidth(s4, 1100).
bandwidth(s5, 900). bandwidth(s6, 1050). bandwidth(s7, 1100). bandwidth(s8, 990).
latency(s1, 5). latency(s2, 7). latency(s3, 9). latency(s4, 6).
latency(s5, 8). latency(s6, 7). latency(s7, 6). latency(s8, 9).

% VMs
% Compact resource values, reasonable sums per company (see below)
vm(vm1).  vm(vm2).  vm(vm3).  vm(vm4).  vm(vm5).
vm(vm6).  vm(vm7).  vm(vm8).  vm(vm9).  vm(vm10).
vm(vm11). vm(vm12). vm(vm13). vm(vm14). vm(vm15).
vm(vm16). vm(vm17). vm(vm18). vm(vm19). vm(vm20).

vm_require(vm1, cpu, 10).   vm_require(vm1, memory, 20).  vm_require(vm1, storage, 60).
vm_require(vm2, cpu, 8).    vm_require(vm2, memory, 18).  vm_require(vm2, storage, 50).
vm_require(vm3, cpu, 13).   vm_require(vm3, memory, 26).  vm_require(vm3, storage, 70).
vm_require(vm4, cpu, 15).   vm_require(vm4, memory, 30).  vm_require(vm4, storage, 80).
vm_require(vm5, cpu, 12).   vm_require(vm5, memory, 27).  vm_require(vm5, storage, 90).
vm_require(vm6, cpu, 12).   vm_require(vm6, memory, 25).  vm_require(vm6, storage, 65).
vm_require(vm7, cpu, 8).    vm_require(vm7, memory, 16).  vm_require(vm7, storage, 45).
vm_require(vm8, cpu, 16).   vm_require(vm8, memory, 29).  vm_require(vm8, storage, 85).
vm_require(vm9, cpu, 9).    vm_require(vm9, memory, 19).  vm_require(vm9, storage, 55).
vm_require(vm10, cpu, 8).   vm_require(vm10, memory, 20). vm_require(vm10, storage, 65).
vm_require(vm11, cpu, 14).  vm_require(vm11, memory, 28). vm_require(vm11, storage, 90).
vm_require(vm12, cpu, 13).  vm_require(vm12, memory, 24). vm_require(vm12, storage, 80).
vm_require(vm13, cpu, 15).  vm_require(vm13, memory, 32). vm_require(vm13, storage, 90).
vm_require(vm14, cpu, 9).   vm_require(vm14, memory, 21). vm_require(vm14, storage, 55).
vm_require(vm15, cpu, 13).  vm_require(vm15, memory, 28). vm_require(vm15, storage, 95).
vm_require(vm16, cpu, 15).  vm_require(vm16, memory, 34). vm_require(vm16, storage, 100).
vm_require(vm17, cpu, 12).  vm_require(vm17, memory, 23). vm_require(vm17, storage, 70).
vm_require(vm18, cpu, 14).  vm_require(vm18, memory, 29). vm_require(vm18, storage, 85).
vm_require(vm19, cpu, 13).  vm_require(vm19, memory, 25). vm_require(vm19, storage, 95).
vm_require(vm20, cpu, 10).  vm_require(vm20, memory, 20). vm_require(vm20, storage, 65).

% Affinity / Anti-affinity
vm_affinity(vm1, vm2).
vm_affinity(vm3, vm4).
vm_affinity(vm7, vm8).
vm_affinity(vm9, vm10).
vm_affinity(vm15, vm16).
vm_anti_affinity(vm5, vm6).
vm_anti_affinity(vm11, vm12).
vm_anti_affinity(vm13, vm14).
vm_anti_affinity(vm18, vm19).

% Priorities
vm_priority(vm1, critical).  vm_priority(vm2, critical).
vm_priority(vm4, critical).  vm_priority(vm8, critical).
vm_priority(vm11, critical). vm_priority(vm15, critical).
vm_priority(vm17, critical). vm_priority(vm20, critical).
% the rest: regular
vm_priority(vm3, regular).   vm_priority(vm5, regular).
vm_priority(vm6, regular).   vm_priority(vm7, regular).
vm_priority(vm9, regular).   vm_priority(vm10, regular).
vm_priority(vm12, regular).  vm_priority(vm13, regular).
vm_priority(vm14, regular).  vm_priority(vm16, regular).
vm_priority(vm18, regular).  vm_priority(vm19, regular).

% Ownership
company(abibas). company(voltswagen). company(oddi). company(poma).
company_pack(abibas, gold).
company_pack(voltswagen, gold).
company_pack(oddi, silver).
company_pack(poma, silver).

vm_company(vm1, abibas).  vm_company(vm2, abibas).  vm_company(vm3, abibas).  vm_company(vm4, abibas).  vm_company(vm5, voltswagen).
vm_company(vm6, voltswagen).  vm_company(vm7, voltswagen).  vm_company(vm8, abibas).  vm_company(vm9, oddi).  vm_company(vm10, oddi).
vm_company(vm11, oddi). vm_company(vm12, abibas).  vm_company(vm13, poma).  vm_company(vm14, poma).
vm_company(vm15, voltswagen).  vm_company(vm16, voltswagen). vm_company(vm17, oddi). vm_company(vm18, abibas).
vm_company(vm19, oddi). vm_company(vm20, poma).

%Bandwidth & Latency
min_bandwidth(vm1, 750).  min_bandwidth(vm2, 750).
min_bandwidth(vm3, 900).  min_bandwidth(vm4, 900).
min_bandwidth(vm5, 950).  min_bandwidth(vm6, 950).
min_bandwidth(vm7, 800).  min_bandwidth(vm8, 800).
min_bandwidth(vm9, 1120). min_bandwidth(vm10, 1120).
min_bandwidth(vm11, 920). min_bandwidth(vm12, 970).
min_bandwidth(vm13, 950). min_bandwidth(vm14, 1000).
min_bandwidth(vm15, 990). min_bandwidth(vm16, 900).
min_bandwidth(vm17, 920). min_bandwidth(vm18, 900).
min_bandwidth(vm19, 970). min_bandwidth(vm20, 950).

max_latency(vm1, 8).  max_latency(vm2, 7).
max_latency(vm3, 6).  max_latency(vm4, 6).
max_latency(vm5, 9).  max_latency(vm6, 9).
max_latency(vm7, 10). max_latency(vm8, 10).
max_latency(vm9, 7).  max_latency(vm10, 7).
max_latency(vm11, 8). max_latency(vm12, 8).
max_latency(vm13, 7). max_latency(vm14, 7).
max_latency(vm15, 8). max_latency(vm16, 8).
max_latency(vm17, 8). max_latency(vm18, 8).
max_latency(vm19, 8). max_latency(vm20, 8).

% License costs
license(vm1, 11). license(vm2, 11).
license(vm3, 9).  license(vm4, 8).
license(vm5, 12). license(vm6, 12).
license(vm7, 7).  license(vm8, 10).
license(vm9, 8).  license(vm10, 7).
license(vm11, 10).license(vm12, 11).
license(vm13, 9). license(vm14, 10).
license(vm15, 11).license(vm16, 9).
license(vm17, 10).license(vm18, 11).
license(vm19, 9). license(vm20, 12).

% Data locality
data_locality(vm8, europe).
data_locality(vm9, us_east).
data_locality(vm6, asia).
data_locality(vm12, europe).

% Packages
package(silver, cpu, 70). package(silver, memory, 300). package(silver, storage, 700).
package(gold, cpu, 180).  package(gold, memory, 680).  package(gold, storage, 1500).

% SLA Reservation
sla_reservation(critical, cpu, 20).
sla_threshold(cpu,60).

% Maintenance & Power 
maintenance(s1, off). maintenance(s2, off). maintenance(s3, off). maintenance(s4, off).
maintenance(s5, off). maintenance(s6, off). maintenance(s7, off). maintenance(s8, off).
power_threshold(1200).

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