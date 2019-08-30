using Test, GeoDatasets


@testset "landseamask" begin
    lon,lat,data = GeoDatasets.landseamask(;resolution='c',grid=5)
    @test size(data,1) == length(lon)
    @test size(data,2) == length(lat)

    @test_throws ErrorException GeoDatasets.landseamask(;resolution='c',grid=-999)
    @test_throws ErrorException GeoDatasets.landseamask(;resolution='g',grid=5)
end
