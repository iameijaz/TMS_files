#!/usr/bin/env python
# coding: utf-8
#
# FCC Crystal Generator with Basis Vectors and Arbitrary Orientation
# Submission-compliant for TMS Exercise 2
# Author: Ijaz Ahmed
# Date: 2025

import numpy as np

def parseInputArgs():
    params = {
        'crystal_type': 'fcc',
        'lattice_constant': 4.09,  # Angstrom
        'nx': 4,
        'ny': 4,
        'nz': 4,
        'vecX': np.array([1, 1, 0]),  # Miller indices for x-direction
        'vecY': np.array([1, -1, 0]), # Miller indices for y-direction
        'element': 'Ag',
        'output_file': 'FCC_PureOrientation.xyz'
    }
    return params

def defineBasisVectors(crystal_type, lattice_constant):
    if crystal_type.lower() == 'fcc':
        basis = np.array([
            [0.0, 0.0, 0.0],
            [0.5, 0.5, 0.0],
            [0.5, 0.0, 0.5],
            [0.0, 0.5, 0.5]
        ])
        prim_vectors = np.array([
            [1.0, 0.0, 0.0],
            [0.0, 1.0, 0.0],
            [0.0, 0.0, 1.0]
        ]) * lattice_constant
    else:
        raise ValueError("Only FCC is implemented.")
    return prim_vectors, basis

def getRotationMatrix(vecX, vecY):
    x_axis = vecX / np.linalg.norm(vecX)
    y_axis = vecY - np.dot(vecY, x_axis) * x_axis
    y_axis /= np.linalg.norm(y_axis)
    z_axis = np.cross(x_axis, y_axis)
    RotMat = np.vstack((x_axis, y_axis, z_axis)).T
    return RotMat

def atomPosition(params, prim_vectors, basis, RotMat):
    nx, ny, nz = params['nx'], params['ny'], params['nz']
    element = params['element']
    positions = []

    rotated_vectors = np.dot(prim_vectors, RotMat)

    for i in range(nx):
        for j in range(ny):
            for k in range(nz):
                lattice_shift = i * rotated_vectors[0] + j * rotated_vectors[1] + k * rotated_vectors[2]
                for b in basis:
                    pos = lattice_shift + np.dot(b, rotated_vectors)
                    positions.append(pos)

    positions = np.array(positions)

    with open(params['output_file'], 'w') as f:
        f.write(f"{len(positions)}\nGenerated FCC crystal structure\n")
        for atom in positions:
            f.write(f"{element} {atom[0]:.6f} {atom[1]:.6f} {atom[2]:.6f}\n")

if __name__ == "__main__":
    params = parseInputArgs()
    prim_vectors, basis = defineBasisVectors(params['crystal_type'], params['lattice_constant'])
    RotMat = getRotationMatrix(params['vecX'], params['vecY'])
    atomPosition(params, prim_vectors, basis, RotMat)

