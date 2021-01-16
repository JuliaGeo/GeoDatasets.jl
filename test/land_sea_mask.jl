@testset "land_sea_mask" begin
    lon,lat,data = GeoDatasets.landseamask(;resolution='c',grid=5)
    @test size(data,1) == length(lon)
    @test size(data,2) == length(lat)

    @test_throws ErrorException GeoDatasets.landseamask(;resolution='c',grid=-999)
    @test_throws ErrorException GeoDatasets.landseamask(;resolution='g',grid=5)

    mask = GeoDatasets.LandSeaMask()
    @test GeoDatasets.is_land(mask, 52.200475, 0.1138)
    @test !GeoDatasets.is_land(mask, 56.615841, 3.39206)
end
