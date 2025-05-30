#!/usr/bin/python
# Insertion of a loop in a SX with orientation x=[110]; y=[1-12]; z=[1-1-1]
# @author: A. Prakash
# @date: Sun Sep 23 14:02:35 CEST 2018

import numpy as np
# Normal to the glide plane
n=np.array([1, -1,  1])
# Vector belonging to the glide plane (in system coordinates)
a=np.array([ 1,  0,  0])
b=np.array([ 0,  1,  0])
a=a/np.linalg.norm(a)
b=b/np.linalg.norm(b)
# c is the center of the dislocation loop - center of our sim box (preferably) --> NOTE: In Angstroms
# Make sure that the point does not coincide with an atom!
c=np.array([57.0, 59.0, 56.0])
# We want 6 points on our dislocation loop! (so 60 deg segments)
tdeg=np.arange(0.0,360.0,60.0)
trad=tdeg*np.pi/180.0
# radius of the loop, NOTE: In Angstroms
r=35.0
print c[0],c[1],c[2]
# Now we compute our points on the loop
for p in trad:
  x=c[0]+r*np.cos(p)*a[0]+r*np.sin(p)*b[0]
  y=c[1]+r*np.cos(p)*a[1]+r*np.sin(p)*b[1]
  z=c[2]+r*np.cos(p)*a[2]+r*np.sin(p)*b[2]
  print x,y,z

