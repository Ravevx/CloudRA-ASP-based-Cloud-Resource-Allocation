% Medium Project ASP
% uday jayesh 

% If VM has no license cost specified then assume 0
license(V,0) :- vm(V), not license(V,_).

% assigning VM (each VM on exactly one server)
1 { assign(V,S) : server(S) } 1 :- vm(V).

% locality (VM must run in the required region)
:- assign(V,S),
   data_locality(V,VL),
   server_region(S,SL),
   VL != SL.

% affinity constraints

% must run together
:- vm_affinity(V1,V2),
   assign(V1,S1),
   assign(V2,S2),
   S1 != S2.

% must not be together
:- vm_anti_affinity(V1,V2),
   assign(V1,S),
   assign(V2,S).

% resource usage - cpu memory storage per server
used_cpu(S,CPU) :-
    server(S),
    CPU = #sum { Rc,V : assign(V,S), vm_require(V,cpu,Rc) }.

used_memory(S,M) :-
    server(S),
    M = #sum { Rm,V : assign(V,S), vm_require(V,memory,Rm) }.

used_storage(S,St) :-
    server(S),
    St = #sum { Rs,V : assign(V,S), vm_require(V,storage,Rs) }.

% usage exceeding capacity
:- used_cpu(S,U),server_capacity(S,cpu,Cap),U > Cap.
:- used_memory(S,U),server_capacity(S,memory,CapM),U > CapM.
:- used_storage(S,U),server_capacity(S,storage,CapS),U > CapS.


% COMPANY PACKAGE CAPACITY LIMITS

% total usage per company
company_used(C,cpu,U) :-
    company(C),
    U = #sum { R,V,S : assign(V,S), vm_company(V,C), vm_require(V,cpu,R) }.

company_used(C,memory,U) :-
    company(C),
    U = #sum { R,V,S : assign(V,S), vm_company(V,C), vm_require(V,memory,R) }.

company_used(C,storage,U) :-
    company(C),
    U = #sum { R,V,S : assign(V,S), vm_company(V,C), vm_require(V,storage,R) }.

% enforce package limits
:- company_used(C,cpu,U),
   company_pack(C,P),
   package(P,cpu,PC),
   U > PC.

:- company_used(C,memory,U),
   company_pack(C,P),
   package(P,memory,PM),
   U > PM.

:- company_used(C,storage,U),
   company_pack(C,P),
   package(P,storage,PS),
   U > PS.


% utilisation

used_server(S) :- used_cpu(S,U), U > 0.

cpu_util(S,P) :-
    used_cpu(S,U),
    server_capacity(S,cpu,Cap),
    Cap > 0,
    P = (U * 100) / Cap.

memory_util(S,P) :-
    used_memory(S,Mem),
    server_capacity(S,memory,CapM),
    CapM > 0,
    P = (Mem * 100) / CapM.


% power consumed only if server used
server_power_consumed(S,P) :-
    used_server(S),
    server_power(S,P).

% total power
total_power(T) :-
    T = #sum { P,S : server_power_consumed(S,P) }.


% cost for each company (license + all servers they touch)

% company C uses server S
company_uses_server(C,S) :-
    assign(V,S),
    vm_company(V,C).

% license costs
license_cost(C,LC) :-
    company(C),
    LC = #sum { Price,V,S :assign(V,S),vm_company(V,C),license(V,Price)}.

% server costs
server_cost(C,SC) :-
    company(C),
    SC = #sum { Price,S :company_uses_server(C,S),cost(S,Price)}.

% total cost
company_total_cost(C,Total) :-
    license_cost(C,LC),
    server_cost(C,SC),
    Total = LC + SC.


% SLA checks

sla_violation(S) :-
    cpu_util(S,P),
    sla_threshold(cpu,T),
    P > T.

sla_violation(S) :-
    memory_util(S,P),
    sla_threshold(memory,T),
    P > T.


% OPTIMIZATION

optimize_on.
#minimize { Cost@3,C : company_total_cost(C,Cost), optimize_on }.
#minimize { 1@2,S : used_server(S), optimize_on }.
#minimize { Pow@1,S : server_power_consumed(S,Pow), optimize_on }.
#minimize { 20@0,S : used_server(S), server_type(S,backup), optimize_on }.



% For ui- max cost, forbid server

max_cost(C,M) :- max_cost_on, max_cost_value(C,M).
:- max_cost_on, max_cost(C,M), company_total_cost(C,Cost), Cost > M.

:- forbid_server(S), used_server(S).



% OUTPUT

#show assign/2.
#show used_server/1.
#show used_cpu/2.
#show used_memory/2.
#show used_storage/2.
#show cpu_util/2.
#show memory_util/2.
#show server_power_consumed/2.
#show company_total_cost/2.
#show total_power/1.
#show sla_violation/1.
#show max_cost/2.
#show max_cost_value/2.
#show max_cost_on/0.


% FOR DASHBOARD UI

% total resource usage per company (for widgets)
company_cpu_used(C,CPU) :-
    company(C),
    CPU = #sum { Rc,V,S : assign(V,S), vm_company(V,C), vm_require(V,cpu,Rc) }.

company_memory_used(C,M) :-
    company(C),
    M = #sum { Rm,V,S : assign(V,S), vm_company(V,C), vm_require(V,memory,Rm) }.

company_storage_used(C,St) :-
    company(C),
    St = #sum { Rs,V,S : assign(V,S), vm_company(V,C), vm_require(V,storage,Rs) }.

% critical vs regular VM counts
critical_vms(N) :-
    N = #count { V : vm_priority(V,critical) }.

regular_vms(N) :-
    N = #count { V : vm_priority(V,regular) }.
