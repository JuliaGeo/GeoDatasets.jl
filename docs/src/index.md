# GeoDatasets

The aim of this package is to give access to common geographics datasets such as:
* location of shoreline
* location of rivers
* major political boundaries



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

The land-sea mask can also be used to plot the land-masses as a gray patch:

```@example
using PyPlot, GeoDatasets, Statistics
clf() # hide
function plotmap(; patchcolor = [.8,.8,.8], resolution='i', grid=5)
    xl = xlim()
    yl = ylim()
    lon,lat,data = GeoDatasets.landseamask(resolution=resolution,grid=grid)
    contourf(lon,lat,data',levels = [0.5,2],colors = [patchcolor]);
    xlim(xl)
    ylim(yl)
end
plot([-10,37],[30,46]) # plot something more useful
plotmap() # call colorbar() before plotmap()
gca().set_aspect(1/cosd(mean(ylim()))) # set aspect ratio
savefig("landseamask-coastline-plotmap.png"); nothing # hide
```

![](landseamask-coastline-plotmap.png)

The `LandSeaMask` type is provided to encapsulate the output from `landseamask`, and
provides simple functionality to determine whether a particular lat-lon is over land or not:
```@example
using GeoDatasets
mask = GeoDatasets.LandSeaMask(; resolution='c', grid=5)
GeoDatasets.is_land(mask, 52.2, 2.0)
```

## Global Self-consistent, Hierarchical, High-resolution Geography Database (gshhg)


```@docs
GeoDatasets.gshhg
GeoDatasets.WDBII_river
GeoDatasets.WDBII_border
```

```@example
using PyPlot, GeoDatasets
figure(figsize=(10,6)) # hide
res = 'c'

# coastline
for (lon,lat) in GeoDatasets.gshhg(res,[1,5])
    plot(lon,lat,"-",color="k", linewidth = 0.7)
end

# rivers
for (lon,lat) in GeoDatasets.WDBII_river(res,[1,2])
    plot(lon,lat,"b-",alpha = 0.5, linewidth = 0.5)
end

# borders
for (lon,lat) in GeoDatasets.WDBII_border(res,1)
    plot(lon,lat,"g-",alpha = 0.8, linewidth = 0.3)
end
gca().set_aspect(1)
xlim(-180,180)
ylim(-90,90)
savefig("gshhg-plot.png"); nothing # hide
```

![](gshhg-plot.png)
