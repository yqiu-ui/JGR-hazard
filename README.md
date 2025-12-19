# JGR-hazard
This repository contains data/model files support the modelling work for article "Sediment transport potential during earthquake-induced tsunamis."
The data/model files are in four categories. The detailed files for each category are described below:
1. SCHISM model:
   - hgrid.gr3 (Grid and Bathymetry data that can reproduce mesh in Figure S1)
   - bdef.gr3 (Seabed deformation file generate from OKADA85 model)
   - drag.gr3 (self-defined bottom drag data)
   - param.in (input file for SCHISM model)
   - vgrid.in (vertical grid)
   - btides.in (boundary condition)

2. OpenSees model:
   - c2.py (Main OpenSees model in python - needs to be modified for different waveshape/loading cases)
   - earthquakevelo.txt (OpenSees earthquake velocity input file)
   - schismwaveshpae1.txt (OpenSees wave elevation input file - fault style 1)
   - schismwaveshpae2.txt (OpenSees wave elevation input file - fault style 2)

3. Data files:



4. Plotting:
