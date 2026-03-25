
% affinity and anti affinity 


company(oracle).
company_pack(oracle, gold).

% Servers
server(s1). server(s2). server(s3).
server_region(s1,us_east). server_region(s2,us_east). server_region(s3,us_east).

server_capacity(s1,cpu,48). server_capacity(s1,memory,96). server_capacity(s1,storage,400).
server_capacity(s2,cpu,48). server_capacity(s2,memory,96). server_capacity(s2,storage,400).
server_capacity(s3,cpu,48). server_capacity(s3,memory,96). server_capacity(s3,storage,400).

server_power(s1,120). server_power(s2,120). server_power(s3,120).
cost(s1,25). cost(s2,25). cost(s3,25).

% VMs
vm(a1). vm_company(a1,oracle).
vm_require(a1,cpu,10). vm_require(a1,memory,16). vm_require(a1,storage,20).
data_locality(a1,us_east).
license(a1,0).

vm(a2). vm_company(a2,oracle).
vm_require(a2,cpu,12). vm_require(a2,memory,20). vm_require(a2,storage,30).
data_locality(a2,us_east).
license(a2,0).

vm(b1). vm_company(b1,oracle).
vm_require(b1,cpu,16). vm_require(b1,memory,32). vm_require(b1,storage,40).
data_locality(b1,us_east).
license(b1,0).

vm(b2). vm_company(b2,oracle).
vm_require(b2,cpu,18). vm_require(b2,memory,24). vm_require(b2,storage,35).
data_locality(b2,us_east).
license(b2,0).

% policies
affinity(a1,a2).
anti_affinity(b1,b2).

sla_threshold(cpu,85).
sla_threshold(memory,85).