using GeoDatasets
using NCDatasets: NCDataset
using Test

include("land_sea_mask.jl")
include("basin_masks.jl")

@testset "gshhg" begin
    res = 'c'
    @test length(GeoDatasets.gshhg(res,[1,5])) > 300
    @test length(GeoDatasets.WDBII_river(res,[1,2])) > 1000
    @test length(GeoDatasets.WDBII_border(res,[1])) >  100

    # resolution 'x' does not exists
    @test_throws ErrorException GeoDatasets.gshhg('x',[1,5])
end
