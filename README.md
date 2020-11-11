[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://JuliaGeo.github.io/GeoDatasets.jl/stable)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://JuliaGeo.github.io/GeoDatasets.jl/dev)
[![Build Status](https://github.com/JuliaGeo/GeoDatasets.jl/workflows/CI/badge.svg)](https://github.com/JuliaGeo/GeoDatasets.jl/actions)
[![Windows Build Status](https://ci.appveyor.com/api/projects/status/github/JuliaGeo/GeoDatasets.jl?branch=master&svg=true)](https://ci.appveyor.com/project/Alexander-Barth/geodatasets-jl/branch/master)
[![codecov.io](http://codecov.io/github/JuliaGeo/GeoDatasets.jl/coverage.svg?branch=master)](http://codecov.io/github/JuliaGeo/GeoDatasets.jl?branch=master)

The aim of this package is to give access to common geographics datasets. Currently it contains:
* the global land-sea-river mask from [GMT](http://gmt.soest.hawaii.edu/)
* the [Global Self-consistent, Hierarchical, High-resolution Geography Database (gshhg)](https://www.soest.hawaii.edu/pwessel/gshhg/).

Contributions are most welcome. Here are some guidelines:
* data sets should be global in scope
* available under a license allowing redistribution
* hosted on a publicly available server


# Installation

Install Julia 1.0 (or later) and issue the commands:

```julia
using Pkg
Pkg.add("GeoDatasets")
```

# Documentation

Documentation is available [here](https://JuliaGeo.github.io/GeoDatasets.jl/dev).
