# GeoDatasets

GeoDatasets Julia package repo.


## Land-sea-lake mask

```@docs
GeoDatasets.landseamask
```

Example plot of the coarse resolution land-sea-lake mask (rasterized at 5 arc minutes).

```@example
using PyPlot, GeoDatasets
lon,lat,data = GeoDatasets.landseamask(;resolution='c',grid=5)
pcolormesh(lon,lat,data')
colorbar(orientation="horizontal")
gca().set_aspect(1)
savefig("landseamask-plot.png"); nothing # hide
```

![](landseamask-plot.png)

Coast-line from this raster data:

```@example
using PyPlot, GeoDatasets
clf() # hide
lon,lat,data = GeoDatasets.landseamask(;resolution='c',grid=5)
contour(lon,lat,data',[0.5],colors=[[0.2,0.2,0.2]],linewidths=0.5)
gca().set_aspect(1)
savefig("landseamask-coastline-plot.png"); nothing # hide
```

![](landseamask-coastline-plot.png)
