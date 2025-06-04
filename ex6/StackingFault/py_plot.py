import numpy as np
import matplotlib.pyplot as plt

# Load your cleaned SFE_displace file
data = np.loadtxt('SFE_displace')

# Since your extraction gave 3 columns (x_displace, Bx_displace, SFE)
displacement = data[:, 1]  # Bx_displace (normalized displacement: 0 → 2.0)
sfe_mJ_m2 = data[:, 2]     # SFE in mJ/m²

# Convert to J/m²
sfe_J_m2 = sfe_mJ_m2 / 1000

# Plotting
plt.figure(figsize=(8, 5))
plt.plot(displacement, sfe_J_m2, 'bo-', label="SFE curve")

plt.title("Stacking Fault Energy Curve")
plt.xlabel("Normalized displacement (fraction of Burgers vector)")
plt.ylabel("Stacking Fault Energy (J/m²)")
plt.grid(True)
plt.legend()

# Save plot
plt.savefig("StackingFaultEnergy_PVL.png", dpi=300)
plt.show()

