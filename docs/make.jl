using Documenter, GeoDatasets

makedocs(modules = [GeoDatasets], sitename = "GeoDatasets.jl")

deploydocs(
    repo = "github.com/JuliaGeo/GeoDatasets.jl.git",
)
