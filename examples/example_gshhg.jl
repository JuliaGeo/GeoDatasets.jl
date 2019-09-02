using PyPlot
using GeoDatasets

res = 'c'

# coastline
for (lon,lat) in GeoDatasets.gshhg(res,[1,5])
    plot(lon,lat,"-",color="k")
end

# rivers
for (lon,lat) in GeoDatasets.WDBII_river(res,[1,2])
    plot(lon,lat,"b-",alpha = 0.5, linewidth = 0.5)
end

# borders
for (lon,lat) in GeoDatasets.WDBII_border(res,1)
    plot(lon,lat,"g-",alpha = 0.8, linewidth = 0.3)
end
