import numpy as np
import matplotlib.pyplot as plt

# Load twin fault data file
data = np.loadtxt('TFE_displace')

# First column is normalized displacement (Bxt_displace), second column is TFE in mJ/m²
displacement = data[:, 0]
tfe_mJ_m2 = data[:, 1]

# Convert to J/m²
tfe_J_m2 = tfe_mJ_m2 / 1000

# Plot
plt.figure(figsize=(8, 5))
plt.plot(displacement, tfe_J_m2, 'ro-', label="Twin Fault Energy")
plt.title("Twin Fault Energy Curve")
plt.xlabel("Normalized displacement")
plt.ylabel("TFE (J/m²)")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.savefig("TwinFaultEnergy.png", dpi=300)
plt.show()

