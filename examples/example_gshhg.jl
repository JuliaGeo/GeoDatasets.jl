using PyPlot
using GeoDatasets


res = 'c'

# coastline
for (x,y) in GeoDatasets.gshhg(res,[1,5])
    plot(x,y,"-",color="k")
end

# rivers
for (x,y) in GeoDatasets.WDBII_river(res,[1,2])
    plot(x,y,"b-",alpha = 0.5, linewidth = 0.5)
end

# borders
for (x,y) in GeoDatasets.WDBII_border(res,1)
    plot(x,y,"g-",alpha = 0.8, linewidth = 0.3)
end
