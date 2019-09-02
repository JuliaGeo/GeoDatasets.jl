[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://JuliaGeo.github.io/GeoDatasets.jl/stable)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://JuliaGeo.github.io/GeoDatasets.jl/dev)
[![Build Status](https://travis-ci.org/JuliaGeo/GeoDatasets.jl.svg?branch=master)](https://travis-ci.org/JuliaGeo/GeoDatasets.jl)
[![Windows Build Status](https://ci.appveyor.com/api/projects/status/github/JuliaGeo/GeoDatasets.jl?branch=master&svg=true)](https://ci.appveyor.com/project/Alexander-Barth/geodatasets-jl/branch/master)
[![Coverage Status](https://coveralls.io/repos/JuliaGeo/GeoDatasets.jl/badge.svg?branch=master)](https://coveralls.io/r/JuliaGeo/GeoDatasets.jl?branch=master)

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
Pkg.add(PackageSpec(url="https://github.com/JuliaGeo/GeoDatasets.jl", rev="master"))
```

# Documentation

Documentation is available [here](https://JuliaGeo.github.io/GeoDatasets.jl/dev).
