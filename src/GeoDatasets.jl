module GeoDatasets

using RemoteFiles
using CodecZlib


"""
    lon,lat,data = GeoDatasets.landseamask(;resolution='l',grid=5)

Load the land-sea-lake raster from basemap: 0 is ocean, 1 is land and 2 is lake.
`grid` is the resolution in arc seconds and should be either 1.25, 2.5, 5 or 10.
The parameter `resolution` should be either 'c','l','i','h' or 'f'.

The data is downloaded from:
https://github.com/matplotlib/basemap/tree/master/lib/mpl_toolkits/basemap/data

The data is originally from [GMT](http://gmt.soest.hawaii.edu/) and distributed under the terms of the
[GPL licences](https://github.com/matplotlib/basemap/blob/a551c2361314670dc7d95143190d3d48ba750d20/LICENSE_data).

```julia
using PyPlot
lon,lat,data = GeoDatasets.landseamask(;resolution='c',grid=5)
pcolormesh(lon,lat,data'); colorbar()
savefig("f-plot.svg"); nothing # hide
```

"""
function landseamask(;resolution='l',grid=5)
    if !(grid ∈ Set([1.25,2.5,5.,10.]))
        error("grid should be either 1.25, 2.5, 5 or 10")
    end
    if !(resolution ∈ Set(['c','l','i','h','f']))
        error("resolution should be either 'c','l','i','h' or 'f'")
    end

    # download remote file if it is not yet available
    @RemoteFile(lsmask, "https://raw.githubusercontent.com/matplotlib/basemap/master/lib/mpl_toolkits/basemap/data/lsmask_$(grid)min_$(resolution).bin")
    download(lsmask)

    # resolution in arc seconds
    res = round(Int,grid * 60)

    lon = (-180*3600 + res/2:res:180*3600 - res/2) / 3600
    lat = (-90*3600 + res/2:res:90*3600 - res/2) / 3600

    data = zeros(UInt8,length(lon)*length(lat));
    read!(GzipDecompressorStream(open(path(lsmask))),data);

    return lon,lat,reshape(data,length(lon),length(lat))
end


end
