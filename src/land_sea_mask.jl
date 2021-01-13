"""
    lon,lat,data = GeoDatasets.landseamask(;resolution='l',grid=5)

Load the land-sea-lake raster from basemap: 0 is ocean, 1 is land and 2 is lake.
`grid` is the resolution in arc minutes and should be either 1.25, 2.5, 5 or 10.
The parameter `resolution` should be either `'c'`,`'l'`,`'i'`,`'h'` or `'f'`
(standing for crude, low, intermediate, high and full resolution)

The data is downloaded from [basemap](https://github.com/matplotlib/basemap/tree/master/lib/mpl_toolkits/basemap_data).

The data is originally from [GMT](http://gmt.soest.hawaii.edu/) and distributed under the terms of the
[GPL licences](https://github.com/matplotlib/basemap/blob/a551c2361314670dc7d95143190d3d48ba750d20/LICENSE_data).

```julia
using GeoDatasets
lon,lat,data = GeoDatasets.landseamask(;resolution='c',grid=5)
```

"""
function landseamask(;resolution='l',grid=5)
    if !(grid ∈ Set([1.25,2.5,5.,10.]))
        error("grid should be either 1.25, 2.5, 5 or 10")
    end
    if !(resolution ∈ Set(['c','l','i','h','f',"c","l","i","h","f"]))
        error("resolution should be either 'c','l','i','h' or 'f'")
    end

    url = "https://raw.githubusercontent.com/matplotlib/basemap/master/lib/mpl_toolkits/basemap_data/lsmask_$(grid)min_$(resolution).bin"
    @debug "url for landseamask: $url"

    # download remote file if it is not yet available
    @RemoteFile(lsmask, url)
    download(lsmask)

    # resolution in arc seconds
    res = round(Int,grid * 60)

    lon = (-180*3600 + res/2:res:180*3600 - res/2) / 3600
    lat = (-90*3600 + res/2:res:90*3600 - res/2) / 3600

    data = zeros(UInt8,length(lon)*length(lat));
    read!(GzipDecompressorStream(open(path(lsmask))),data);

    return lon,lat,reshape(data,length(lon),length(lat))
end


"""
    LandSeaMask

Encapsulates the `landseamask` data.
"""
struct LandSeaMask{Tlon, Tlat, Tdata}
    lon::Tlon
    lat::Tlat
    data::Tdata
end

function LandSeaMask(; resolution='l', grid=5)
    return LandSeaMask(GeoDatasets.landseamask(; resolution=resolution, grid=grid)...)
end

"""
    is_land(mask::LandSeaMask, lat::Real, lon::Real)

`true` if the nearest lat-lon in the `mask` to `lat`-`lon` is land. Nearest is calculated
by flooring the lat and lon to the nearest point in the `mask` and return the value of that
entry.
"""
is_land(mask::LandSeaMask, lat::Real, lon::Real) = nearest_point(mask, lat, lon) == 1
is_land(mask::LandSeaMask, (lat, lon)::Tuple{Real, Real}) = is_land(mask, lat, lon)

function nearest_point(mask::LandSeaMask, lat::Real, lon::Real)
    return mask.data[nearest_point_idx(mask.lon, lon), nearest_point_idx(mask.lat, lat)]
end

function nearest_point_idx(xs::StepRangeLen, x::Real)
    return convert(Int, floor((x - first(xs)) / (last(xs) - first(xs)) * length(xs)))
end
