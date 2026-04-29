# CloudRA: ASP-based Cloud Resource Allocation

CloudRA is a cloud resource allocation prototype built with **Answer Set Programming (ASP)** and an interactive dashboard UI. It models a realistic cloud provider scenario with multiple companies, VMs, servers, SLAs, and pricing, and uses multi‑objective optimization to compute high‑quality VM placements.

Developed by **Jayesh Choudhari** and **Uday Kale**.

---
![CloudRA Dashboard](dashboard.jpg)
## Overview

CloudRA answers the question:

> “Given many VMs, servers, and companies with business and technical constraints, how can we automatically allocate VMs to servers in a way that is valid and cost‑efficient?”

Key characteristics:

- 20+ VMs, 11+ servers (including backup servers), 4 companies  
- Multiple constraint dimensions:
  - CPU / memory / storage capacities
  - VM–server locality, bandwidth, latency
  - Affinity / anti‑affinity between VMs
  - Company packages (gold/silver) with resource caps
  - SLA thresholds on utilization
- Multi‑objective optimization:
  - Minimize company costs
  - Minimize number of servers
  - Minimize power consumption
- Interactive UI:
  - Forbid / allow servers
  - Set per‑company max cost
  - Toggle between “optimal” and “any” solutions
  - Step through multiple solutions
  - Visualize the current allocation with Clingraph

---

## Project Structure

The project is organized into three main layers:

### 1. Core ASP Model

Defines the logic of the resource allocation problem.

Typical files:
- `main.lp` – main ASP model:
  - VM placement: `assign(V,S)`
  - Resource usage: `used_cpu/2`, `used_memory/2`, `used_storage/2`
  - Company usage and costs: `company_used/3`, `company_total_cost/2`
  - SLA and utilization: `cpu_util/2`, `memory_util/2`, `sla_violation/1`
  - Optimization objectives: multiple `#minimize` statements with priorities
  - UI-linked constraints: `max_cost_on`, `max_cost_value/2`, `forbid_server/1`
- Optional modular files (depending on repo layout):
  - `servers.lp`, `vm_specs.lp`, `affinity.lp`, `locality.lp`, `constraints.lp`, `optimization.lp`, etc.

Core ideas:
- Each VM is assigned to exactly one server:
  - `1 { assign(V,S) : server(S) } 1 :- vm(V).`
- Resource aggregates per server and per company:
  - Use `#sum` and `#count` to derive usage, costs, power, etc.
- Hard constraints enforce:
  - Capacity, locality, affinity, anti‑affinity, package limits, and SLA thresholds.
- Optimization:
  - Lexicographic layering of cost, number of servers, and power via `#minimize`.

### 2. Instances (Data)

Concrete cloud scenarios.

Typical files:
- `instance-01.lp`, `instance-02.lp`, …:
  - `server/1`, `server_region/2`, `server_capacity/3`
  - `server_power/2`, `cost/2`, `maintenance/2`, `backup_server/1`
  - `vm/1`, `vm_require/3`, `vm_affinity/2`, `vm_anti_affinity/2`
  - `vm_priority/2`, `vm_company/2`
  - `min_bandwidth/2`, `max_latency/2`
  - `company/1`, `company_pack/2`, `package/3`
  - `license/2`, `sla_reservation/3`, `sla_threshold/2`

You can swap instances to test different resource pools and demand profiles without touching the core model or UI.

### 3. Dashboard UI (Clinguin UI)

UI description in ASP that renders a dashboard and connects user actions to the solver.

Main file:
- `ui.lp` – describes:
  - Layout: root flex layout (`main_window`), left and right columns
  - Cards (containers) for:
    - Overview metrics
    - VM assignments
    - Server resources
    - Company costs and max‑cost input
    - Company usage
    - VM info (priority, locality, QoS)
    - Server info (status, region, maintenance)
    - Affinity and anti‑affinity rules
    - Power consumption
  - Right‑side controls:
    - Buttons: “Optimal solutions”, “Any solutions”, “Next solution”
    - Clingraph canvas for graphical visualization

The UI is declarative: `elem/3` defines elements, `attr/3` sets layout and styles, and `when/4` binds user events to solver actions.

---

## How It Works

### Constraints

The ASP model enforces:

- **Server capacity**: VMs assigned to a server cannot exceed its CPU, memory, or storage capacities.
- **Locality & QoS**:
  - Data locality: `data_locality(V,Region)` must match `server_region(S,Region)` for `assign(V,S)`.
  - Bandwidth: `min_bandwidth(V,B)` vs `bandwidth(S,BW)`.
  - Latency: `max_latency(V,L)` vs `latency(S,LS)`.
- **Affinity / anti‑affinity**:
  - Some VMs must run together.
  - Some VMs must not share a server.
- **Company packages**:
  - Each company has a `gold` or `silver` package defining CPU, memory, and storage caps.
  - Aggregated usage per company must stay below these caps.
- **SLAs**:
  - Utilization per server (CPU/memory) is computed.
  - SLA thresholds define what counts as `sla_violation`.

### Costs and Optimization

Costs are modeled per company:

- VM license costs via `license/2`.
- Server costs via `company_uses_server/2` and `cost/2`.
- Total cost per company via `company_total_cost/2`.

Optimization (when `optimize_on` is present) tries to:

1. Minimize total company costs.
2. Minimize number of used servers.
3. Minimize total power consumption.

This is implemented via multiple `#minimize` statements with different priorities (`@3`, `@2`, `@1`, etc.).

---

## Interactive Features

The UI allows the user to influence the solver:

- **Forbid servers**:
  - In the “Server Resources” card, each server has a dropdown with “Use” / “Forbid”.
  - Clicking “Forbid” adds `forbid_server(S)`; a constraint in the model disallows using that server.
- **Per‑company max cost**:
  - In “Company Costs”, each row has a textfield and “Enforce” / “No limit” buttons.
  - Typing a number and clicking “Enforce”:
    - Stores the value in UI context.
    - Adds `max_cost_value(C,M)` and `max_cost_on` facts.
    - A constraint forbids solutions where `company_total_cost(C,Cost) > M`.
  - “No limit” removes those max‑cost facts, returning to unconstrained optimization.
- **Optimization toggle**:
  - “Optimal solutions” adds `optimize_on`, enabling the `#minimize` objectives.
  - “Any solutions” removes it, allowing any satisfying model.
- **Solution enumeration**:
  - “Next solution” requests the next answer set given current constraints.
- **Visualization**:
  - A Clingraph canvas renders the current allocation as a graph (servers, VMs, assignments).

---

## Running the Project

> Note: exact commands may vary depending on your environment and repository structure. Adapt as needed.

1. **Install prerequisites**
   - Clingo (ASP solver)
   - Clinguin (for the dashboard UI)
   - Python (if using helper scripts like `run_clinguin.py` / `solver.py`)

2. **Clone the repository**

```bash
git clone https://github.com/<your-username>/CloudRA-ASP.git
cd CloudRA-ASP
```

3. **Run the UI (example)**

Using Clinguin:

```bash
clinguin ui.lp main.lp instance-01.lp
```

Or via helper script (if provided):

```bash
python run_clinguin.py
```

4. **Open the dashboard**

- Open the URL printed by Clinguin (typically `http://localhost:PORT`) in your browser.
- Use the controls to toggle optimization, forbid servers, set max costs, and step through solutions.

---

## Example Use Cases

- **Explore optimal allocation**:
  - Start with “Optimal solutions”.
  - Inspect VM assignments, server utilization, total cost, SLAs, and power.
- **What if a server fails?**
  - Forbid a key server and hit “Next solution”.
  - See how the system redistributes VMs and how costs / SLAs change.
- **Budget scenario**:
  - Set a lower max cost for one company and enforce it.
  - Watch how the allocation adapts to keep that company’s cost under the new budget.
- **Package tuning**:
  - Change `package/3` definitions in the instance, rerun, and see how tighter or looser packages impact feasibility and optimization.

---

## Credits

- **Developed by**:  
  - Jayesh Choudhari  
  - Uday Kale

- **Technologies**:
  - Answer Set Programming (Clingo)
  - Clinguin UI framework
  - Clingraph (for graph visualization)


