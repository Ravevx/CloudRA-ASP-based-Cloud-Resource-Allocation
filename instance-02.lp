
% multi company competition in shared region


company(google).  company_pack(google, gold).
company(intel). company_pack(intel, silver).

% Servers
server(s1). server(s2).
server_region(s1, us_east).
server_region(s2, us_east).

server_capacity(s1,cpu,48). server_capacity(s1,memory,96). server_capacity(s1,storage,300).
server_capacity(s2,cpu,32). server_capacity(s2,memory,64). server_capacity(s2,storage,200).

server_power(s1,120). server_power(s2,100).
cost(s1,30). cost(s2,20).

% google VMs
vm(g_vm1). vm_company(g_vm1,google).
vm_require(g_vm1,cpu,10). vm_require(g_vm1,memory,16). vm_require(g_vm1,storage,40).
data_locality(g_vm1,us_east).
license(g_vm1,0).

vm(g_vm2). vm_company(g_vm2,google).
vm_require(g_vm2,cpu,12). vm_require(g_vm2,memory,20). vm_require(g_vm2,storage,30).
data_locality(g_vm2,us_east).
license(g_vm2,0).

% intel VMs
vm(i_vm1). vm_company(i_vm1,intel).
vm_require(i_vm1,cpu,16). vm_require(i_vm1,memory,32). vm_require(i_vm1,storage,50).
data_locality(i_vm1,us_east).
license(i_vm1,0).

vm(i_vm2). vm_company(i_vm2,intel).
vm_require(i_vm2,cpu,8). vm_require(i_vm2,memory,16). vm_require(i_vm2,storage,20).
data_locality(i_vm2,us_east).
license(i_vm2,0).

sla_threshold(cpu,85).
sla_threshold(memory,85).