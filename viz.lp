% graph
graph(default).

%company nodes
node(C) :- company(C).

% VM nodes
node(V) :- vm(V).

% Server nodes
node(S) :- server(S).

% Edges- Companyto VM
edge((C,V)) :- vm(V), vm_company(V,C).

% Edges- VM to assigned Server
edge((V,S)) :- assign(V,S).

% asthetics layout 
attr(graph,default,rankdir,"LR").

% helpful spacing
attr(graph,default,nodesep,"0.6").
attr(graph,default,ranksep,"0.9").

% Base styles

% default labels
attr(node,N,label,N) :- node(N).

% all servers- boxes, filled
attr(node,S,shape,box):- server(S).
attr(node,S,style,filled) :- server(S).

% backup servers
attr(node,S,fillcolor,lightgray) :- server(S), server_type(S,backup).

% nonbackup servers
attr(node,S,fillcolor,"#63b0dd") :- server(S), not server_type(S,backup).

% VMs- ellipses, filled
attr(node,V,shape,ellipse):- vm(V).
attr(node,V,style,filled):- vm(V).

% Companies- big rounded boxes
attr(node,C,shape,circle):- company(C).
attr(node,C,style,filled):- company(C).
attr(node,C,fontsize,"18"):- company(C).

%company vm color
company_color(C,white,"#ff9a98") :- company(C).

attr(node,C,fillcolor,Color) :-company(C),company_color(C,Color,_).
attr(node,V,fillcolor,Color) :-vm(V),vm_company(V,C),company_color(C,_,Color).

