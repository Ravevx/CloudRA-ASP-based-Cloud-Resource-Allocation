
% strict data locality requirement


company(samsung).
company_pack(samsung, gold).

% Servers in Europe & Asia
server(eu1). server(eu2). server(as1). server(as2).

server_region(eu1,europe). server_region(eu2,europe).
server_region(as1,asia).   server_region(as2,asia).

server_capacity(eu1,cpu,64). server_capacity(eu1,memory,128). server_capacity(eu1,storage,500).
server_capacity(eu2,cpu,64). server_capacity(eu2,memory,128). server_capacity(eu2,storage,500).

server_capacity(as1,cpu,48). server_capacity(as1,memory,96). server_capacity(as1,storage,300).
server_capacity(as2,cpu,32). server_capacity(as2,memory,64). server_capacity(as2,storage,200).

server_power(eu1,120). server_power(eu2,120).
server_power(as1,140). server_power(as2,90).

cost(eu1,25). cost(eu2,25). cost(as1,30). cost(as2,18).

% VMs must run in Asia
vm(s_vm1). vm_company(s_vm1,samsung).
vm_require(s_vm1,cpu,12). vm_require(s_vm1,memory,24). vm_require(s_vm1,storage,40).
data_locality(s_vm1,asia).

vm(s_vm2). vm_company(s_vm2,samsung).
vm_require(s_vm2,cpu,20). vm_require(s_vm2,memory,32). vm_require(s_vm2,storage,60).
data_locality(s_vm2,asia).

license(s_vm1,0). license(s_vm2,0).

sla_threshold(cpu,90).
sla_threshold(memory,90).