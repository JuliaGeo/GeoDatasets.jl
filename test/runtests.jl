using Test, GeoDatasets


@testset "landseamask" begin
    lon,lat,data = GeoDatasets.landseamask(;resolution='c',grid=5)
    @test size(data,1) == length(lon)
    @test size(data,2) == length(lat)

    @test_throws ErrorException GeoDatasets.landseamask(;resolution='c',grid=-999)
    @test_throws ErrorException GeoDatasets.landseamask(;resolution='g',grid=5)
end


@testset "gshhg" begin
    res = 'c'
    @test length(GeoDatasets.gshhg(res,[1,5])) > 300
    @test length(GeoDatasets.WDBII_river(res,[1,2])) > 1000
    @test length(GeoDatasets.WDBII_border(res,[1])) >  100

    # resolution 'x' does not exists
    @test_throws ErrorException GeoDatasets.gshhg('x',[1,5])
end

