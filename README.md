# VIT Chennai: Complex Hybrid Network Simulation (25 Nodes)

## Project Overview
This repository contains a Scilab script developed for the Network Laboratory at VIT Chennai. It simulates a **25-node Hybrid Topology** integrating Mesh, Star, and Ring architectures using the **NARVAL Toolbox**.

## Scenario: VIBRANCE Event Network Management
To demonstrate the practical application of this topology, the following scenario is considered:

**The Situation:** During the annual **VIBRANCE** fest at VIT Chennai, a 25-node hybrid network is deployed:
- **NSCB Block (Nodes 1-10):** A Mesh Backbone ensures redundant connections for high-traffic servers.
- **Gazebo/Food Court (Nodes 11-17):** A Star Topology connects all digital payment terminals to a central hub (Node 11).
- **Open Air Theatre (Nodes 18-25):** A Ring Topology manages the IoT-based smart lighting and security loop.

### Scenario-Based Questions & Analysis
1. **Link Failure:** If a heavy storm breaks the link between the Admin Core (Node 10) and the OAT (Node 18), which section goes offline?
   - *Result:* The Ring Topology (IoT sensors) will be completely disconnected.
2. **Connectivity Stress:** Which node is the most critical hub in the Star section?
   - *Result:* Node 11, as it maintains the highest degree of connectivity (7 edges).
3. **Visual Verification:** How does node coloring improve network monitoring?
   - *Result:* By coloring all 25 nodes, the system administrator can visually confirm at a glance that every registered device is active and configured.

## Lab Requirements (Operations Performed)
The script automatically executes the following:
- [x] **A & B:** Generation and Numbering of all nodes/edges.
- [x] **C:** Global Node and Edge coloring (Green/Red).
- [x] **D:** Automated Edge Count analysis per node.
- [x] **E:** Calculation of Total Network Size.

## How to Run
1. Open **Scilab 6.0.0**.
2. Install the **NARVAL 3.1** toolbox.
3. Load and execute the `.sce` file provided in this repository.
