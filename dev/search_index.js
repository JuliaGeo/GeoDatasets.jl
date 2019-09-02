var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "GeoDatasets",
    "title": "GeoDatasets",
    "category": "page",
    "text": ""
},

{
    "location": "#GeoDatasets-1",
    "page": "GeoDatasets",
    "title": "GeoDatasets",
    "category": "section",
    "text": "The aim of this package is to give access to common geographics datasets such as:location of shoreline\nlocation of rivers\nmajor political boundaries"
},

{
    "location": "#GeoDatasets.landseamask",
    "page": "GeoDatasets",
    "title": "GeoDatasets.landseamask",
    "category": "function",
    "text": "lon,lat,data = GeoDatasets.landseamask(;resolution=\'l\',grid=5)\n\nLoad the land-sea-lake raster from basemap: 0 is ocean, 1 is land and 2 is lake. grid is the resolution in arc minutes and should be either 1.25, 2.5, 5 or 10. The parameter resolution should be either \'c\',\'l\',\'i\',\'h\' or \'f\' (standing for crude, low, intermediate, high and full resolution)\n\nThe data is downloaded from basemap.\n\nThe data is originally from GMT and distributed under the terms of the GPL licences.\n\nusing GeoDatasets\nlon,lat,data = GeoDatasets.landseamask(;resolution=\'c\',grid=5)\n\n\n\n\n\n"
},

{
    "location": "#Land-sea-lake-mask-1",
    "page": "GeoDatasets",
    "title": "Land-sea-lake mask",
    "category": "section",
    "text": "GeoDatasets.landseamaskExample plot of the coarse resolution land-sea-lake mask (rasterized at 5 arc minutes).using PyPlot, GeoDatasets\nlon,lat,data = GeoDatasets.landseamask(;resolution=\'c\',grid=5)\npcolormesh(lon,lat,data\')\ncolorbar(orientation=\"horizontal\")\ngca().set_aspect(1)\nsavefig(\"landseamask-plot.png\"); nothing # hide(Image: )Coast-line from this raster data:using PyPlot, GeoDatasets\nclf() # hide\nlon,lat,data = GeoDatasets.landseamask(;resolution=\'c\',grid=5)\ncontour(lon,lat,data\',[0.5],colors=[[0.2,0.2,0.2]],linewidths=0.5)\ngca().set_aspect(1)\nsavefig(\"landseamask-coastline-plot.png\"); nothing # hide(Image: )"
},

{
    "location": "#GeoDatasets.gshhg",
    "page": "GeoDatasets",
    "title": "GeoDatasets.gshhg",
    "category": "function",
    "text": "segments = GeoDatasets.gshhg(res,level::Integer)\nsegments = GeoDatasets.gshhg(res,levels::AbstractArray{<:Integer})\n\nExtract a list of coastlines from the Global Self-consistent, Hierarchical, High-resolution Geography Database (about 150 Mb) at the resolution res (\'f\',\'h\',\'i\',\'l\' or \'c\') and the level level (see below). An array of multiple levels can also be provided as the parameter levels. segments is a vector of tuples representing a closed shoreline. Each tuple is composed by a longitude and latitude vector.\n\nThe GSHHG is released under the GNU Lesser General Public License (Version 3) and is described in Wessel, P., and W. H. F. Smith, A Global Self-consistent, Hierarchical, High-resolution Shoreline Database, J. Geophys. Res., 101, 8741-8743, 1996.\n\nThe GSHHG database integrates the CIA World Data Bank II (WDBII) for political borders and rivers.\n\nResolution is one of the following:\n\nres Resolution\nf Full resolution\nh High resolution\ni Intermediate resolution\nl Low resolution\nc Crude resolution\n\nThe shoreline data are distributed in 6 levels:\n\nlevel \n1 Continental land masses and ocean islands, except Antarctica\n2 Lakes\n3 Islands in lakes\n4 Ponds in islands within lakes\n5 Antarctica based on ice front boundary\n6 Antarctica based on grounding line boundary\n\nIf the 2nd parameter levels is ommited, then level 1 and 5 are loaded.\n\n\n\n\n\n"
},

{
    "location": "#GeoDatasets.WDBII_river",
    "page": "GeoDatasets",
    "title": "GeoDatasets.WDBII_river",
    "category": "function",
    "text": "segments = GeoDatasets.WDBII_river(res,level::Integer)\nsegments = GeoDatasets.WDBII_river(res,levels::AbstractArray{<:Integer})\n\nExtract rivers from the WDBII database. See GeoDatasets.gshhg for more information.\n\nThe river database comes with 11 levels:\n\nlevel \n1 Double-lined rivers (river-lakes)\n2 Permanent major rivers\n3 Additional major rivers\n4 Additional rivers\n5 Minor rivers\n6 Intermittent rivers - major\n7 Intermittent rivers - additional\n8 Intermittent rivers - minor\n9 Major canals\n10 Minor canals\n11 Irrigation canals\n\n\n\n\n\n"
},

{
    "location": "#GeoDatasets.WDBII_border",
    "page": "GeoDatasets",
    "title": "GeoDatasets.WDBII_border",
    "category": "function",
    "text": "segments = GeoDatasets.WDBII_border(res,level::Integer)\nsegments = GeoDatasets.WDBII_border(res,levels::AbstractArray{<:Integer})\n\nExtract borders from the WDBII database. See GeoDatasets.gshhg for more information.\n\nThe political boundary data come in 3 levels:\n\nlevel \n1 National boundaries\n2 Internal (state) boundaries for the 8 largest countries only\n3 Maritime boundaries\n\nIf the 2nd parameter level is ommited, then level 1 (National boundaries) are loaded.\n\n\n\n\n\n"
},

{
    "location": "#Global-Self-consistent,-Hierarchical,-High-resolution-Geography-Database-(gshhg)-1",
    "page": "GeoDatasets",
    "title": "Global Self-consistent, Hierarchical, High-resolution Geography Database (gshhg)",
    "category": "section",
    "text": "GeoDatasets.gshhg\nGeoDatasets.WDBII_river\nGeoDatasets.WDBII_borderusing PyPlot, GeoDatasets\nfigure(figsize=(10,6)) # hide\nres = \'c\'\n\n# coastline\nfor (lon,lat) in GeoDatasets.gshhg(res,[1,5])\n    plot(lon,lat,\"-\",color=\"k\", linewidth = 0.7)\nend\n\n# rivers\nfor (lon,lat) in GeoDatasets.WDBII_river(res,[1,2])\n    plot(lon,lat,\"b-\",alpha = 0.5, linewidth = 0.5)\nend\n\n# borders\nfor (lon,lat) in GeoDatasets.WDBII_border(res,1)\n    plot(lon,lat,\"g-\",alpha = 0.8, linewidth = 0.3)\nend\ngca().set_aspect(1)\nxlim(-180,180)\nylim(-90,90)\nsavefig(\"gshhg-plot.png\"); nothing # hide(Image: )"
},

]}
