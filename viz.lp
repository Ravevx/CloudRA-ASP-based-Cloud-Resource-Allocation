% base graph
graph(default).

% Company nodes (one per company in the instance)
node(C) :- company(C).

% VM nodes
node(V) :- vm(V).

% Server nodes
node(S) :- server(S).

% Edges: Companyto VM
edge((C,V)) :- vm(V), vm_company(V,C).

% Edges: VM to assigned Server
edge((V,S)) :- assign(V,S).

% asthetics layout 
attr(graph,default,rankdir,"LR").

% Helpful spacing
attr(graph,default,nodesep,"0.6").
attr(graph,default,ranksep,"0.9").

% =========================
% Base styles
% =========================

% Default labels (use term name)
attr(node,N,label,N) :- node(N).

% All servers: boxes, filled
attr(node,S,shape,box)    :- server(S).
attr(node,S,style,filled) :- server(S).

% Backup servers: dark grey
attr(node,S,fillcolor,lightgray) :- server(S), server_type(S,backup).

% Non‑backup servers
attr(node,S,fillcolor,"#579bc3") :- server(S), not server_type(S,backup).

% VMs- ellipses, filled
attr(node,V,shape,ellipse):- vm(V).
attr(node,V,style,filled):- vm(V).

% Companies- big rounded boxes
attr(node,C,shape,circle):- company(C).
attr(node,C,style,filled):- company(C).
attr(node,C,fontsize,"18"):- company(C).

% One color pair- dark for companies,light for VMs
company_color(C,white,"#EC8F8D") :- company(C).

% Company node colour
attr(node,C,fillcolor,Color) :-
    company(C),
    company_color(C,Color,_).

% VM color- use light color
attr(node,V,fillcolor,Color) :-
    vm(V),
    vm_company(V,C),
    company_color(C,_,Color).

