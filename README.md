# 🤖 Bipedal Gait Analysis using MATLAB

This repository contains a full simulation setup and analytical tools for evaluating bipedal locomotion using MATLAB Simscape Multibody and a URDF-based humanoid robot.

![Preview](img\bipss.png)

## 📂 Project Contents

| File Name | Description |
|-----------|-------------|
| `Humanoid.urdf` | URDF model of the humanoid robot |
| `ImportedURDF.slx` | Simscape Multibody simulation file |
| `jointtorques.m` | Computes joint torques using inverse dynamics |
| `jointpositions.m` | Extracts joint position data over time |
| `mechpow.m` | Calculates mechanical power at each joint |
| `energy.m` | Computes cumulative energy consumption |
| `peaktorque.m` | Detects peak torque values and corresponding timestamps |
| `phasediffbnjointmovts.m` | Computes phase difference between symmetric joints |
| `hipjoint.m` | Extracts motion data specific to the hip joint |
| `Unconfirmed 67354.wmv` | Simulation video (optional, for visualization) |

---
![Preview](img\ss1.png)
![Preview](img\ss2.png)
![Preview](img\ss3.png)
![Preview](img\ss4.png)

## 🧪 Simulation Requirements

This project **must be run in MATLAB**. To reproduce the results:

### ✅ Prerequisites

- MATLAB R2021b or newer
- Simscape Multibody toolbox
- Robotics System Toolbox (for `smimport` if needed)

---

## 🚀 How to Run the Simulation

1. Open MATLAB and navigate to this project directory.
2. Run the following command to launch the model:
   ```matlab
   open_system('ImportedURDF.slx')
   ```
3. Click **Run** to start the simulation.
4. Once simulation completes, you can run the analysis scripts:
   ```matlab
   run('jointtorques.m')
   run('mechpow.m')
   run('energy.m')
   run('peaktorque.m')
   run('phasediffbnjointmovts.m')
   ```

---

## 📊 Output and Results

Each script will compute and optionally save results such as:
- Instantaneous torque/velocity plots
- Mechanical power vs. time graphs
- Phase lag analysis for symmetric joints
- Energy consumption charts
- Peak torque detection tables

---

## 📝 Notes

- All computations are based on simulation logs and are purely data-driven.
- URDF must be compatible with MATLAB’s `smimport` function.
- For reproducibility, ensure consistent joint naming across the URDF and SLX model.


📌 _This repository is intended for academic and research demonstration purposes._
