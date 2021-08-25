module GeoDatasets

using Printf

using RemoteFiles
using CodecZlib
using Shapefile
using GeoInterface
using ZipFile

# Don't import all of the names due to conflicts.
using NCDatasets: NCDataset

include("land_sea_mask.jl")
include("basin_masks.jl")
include("gshhg.jl")

end
