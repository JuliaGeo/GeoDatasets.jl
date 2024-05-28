using Test
using GeoDatasets

@testset "land_sea_mask" begin
    lon,lat,data = GeoDatasets.landseamask(;resolution='c',grid=5)
    @test size(data,1) == length(lon)
    @test size(data,2) == length(lat)

    @test_throws ErrorException GeoDatasets.landseamask(;resolution='c',grid=-999)
    @test_throws ErrorException GeoDatasets.landseamask(;resolution='g',grid=5)

    mask = GeoDatasets.LandSeaMask()

    @test GeoDatasets.is_land(mask, 52.200475, 0.1138)
    @test !GeoDatasets.is_land(mask, 56.615841, 3.39206)

    # check finding the index of the nearest point
    xs = 12.:34.:567.;
    i = 11
    @test GeoDatasets.nearest_point_idx(xs, xs[i]) == i
    @test GeoDatasets.nearest_point_idx(xs, xs[i]+step(xs)/4) == i
    @test GeoDatasets.nearest_point_idx(xs, xs[i]-step(xs)/4) == i

    # wrapping in longitude
    for lon = 90 .* (-4:4)
        GeoDatasets.is_land(mask, 0.0, lon) == GeoDatasets.is_land(mask, 0.0, lon + 360)
    end
end
