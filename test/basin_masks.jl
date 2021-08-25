@testset "basin_masks" begin
    data = GeoDatasets.basin_masks()
    @test data isa NCDataset
end
