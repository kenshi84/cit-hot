This is a stripped and adapted version of the Hyperbolic Orbifold Tutte Embeddings reference implementation at https://github.com/noamaig/hyperbolic_orbifolds/ for use with the Compatible Intrinsic Triangulations (CIT) code at https://github.com/kenshi84/compatible-intrinsic-triangulations.

The code uses [`gptoolbox`](https://github.com/alecjacobson/gptoolbox), so you need to install it to your MATLAB before running.

## Usage example

For a model pair `A-orig.obj` and `B-orig.obj` with landmark pairs described in `landmarks.txt`, put them in the same data directory `data/bumpy-round-cube`, and run the script as follows:

```MATLAB
hot("data/bumpy-round-cube/") 	% don't forget to add slash ("/") to the end
```

This will generate output vertex images `AtoB.txt` and `BtoA.txt` which can be fed to the CIT algorithm.
Additionally, the code generates `AonB.obj` and `BonA.obj` which can be useful for quickly assessing the quality of the map.
