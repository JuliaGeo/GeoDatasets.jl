module GeoDatasets

using Printf

using RemoteFiles
using CodecZlib
using Shapefile
using GeoInterface
using ZipFile

include("land_sea_mask.jl")
include("gshhg.jl")

end
