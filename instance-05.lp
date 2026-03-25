
% triggering SLA stress and backup server


company(netflix).
company_pack(netflix, platinum).

% Primary servers
server(p1). server(p2).
server_region(p1,europe).
server_region(p2,europe).

server_capacity(p1,cpu,40). server_capacity(p1,memory,80). server_capacity(p1,storage,300).
server_capacity(p2,cpu,40). server_capacity(p2,memory,80). server_capacity(p2,storage,300).

server_power(p1,150). server_power(p2,150).
cost(p1,35). cost(p2,35).

% Backup servers
server(b1). server(b2).
server_region(b1,europe). server_region(b2,europe).

server_capacity(b1,cpu,24). server_capacity(b1,memory,48). server_capacity(b1,storage,150).
server_capacity(b2,cpu,24). server_capacity(b2,memory,48). server_capacity(b2,storage,150).

server_power(b1,90). server_power(b2,90).
cost(b1,15). cost(b2,15).

server_type(b1,backup).
server_type(b2,backup).

% Heavy load ( Expecting some load gets transferred to backup)
vm(n1). vm_company(n1,netflix).
vm_require(n1,cpu,20). vm_require(n1,memory,40). vm_require(n1,storage,100).
data_locality(n1,europe).
license(n1,0).

vm(n2). vm_company(n2,netflix).
vm_require(n2,cpu,18). vm_require(n2,memory,30). vm_require(n2,storage,90).
data_locality(n2,europe).
license(n2,0).

vm(n3). vm_company(n3,netflix).
vm_require(n3,cpu,14). vm_require(n3,memory,20). vm_require(n3,storage,60).
data_locality(n3,europe).
license(n3,0).

sla_threshold(cpu,75).
sla_threshold(memory,75).