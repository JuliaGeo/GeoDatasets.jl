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
    "text": "GeoDatasets Julia package repo."
},

{
    "location": "#GeoDatasets.landseamask",
    "page": "GeoDatasets",
    "title": "GeoDatasets.landseamask",
    "category": "function",
    "text": "lon,lat,data = GeoDatasets.landseamask(;resolution=\'l\',grid=5)\n\nLoad the land-sea-lake raster from basemap: 0 is ocean, 1 is land and 2 is lake. grid is the resolution in arc minutes and should be either 1.25, 2.5, 5 or 10. The parameter resolution should be either \'c\',\'l\',\'i\',\'h\' or \'f\'  (standing for crude, low, intermediate, high and full resolution)\n\nThe data is downloaded from basemap.\n\nThe data is originally from GMT and distributed under the terms of the GPL licences.\n\nusing GeoDatasets\nlon,lat,data = GeoDatasets.landseamask(;resolution=\'c\',grid=5)\n\n\n\n\n\n"
},

{
    "location": "#Land-sea-lake-mask-1",
    "page": "GeoDatasets",
    "title": "Land-sea-lake mask",
    "category": "section",
    "text": "GeoDatasets.landseamaskExample plot of the coarse resolution land-sea-lake mask (rasterized at 5 arc minutes).using PyPlot, GeoDatasets\nlon,lat,data = GeoDatasets.landseamask(;resolution=\'c\',grid=5)\npcolormesh(lon,lat,data\')\ncolorbar(orientation=\"horizontal\")\ngca().set_aspect(1)\nsavefig(\"landseamask-plot.png\"); nothing # hide(Image: )Coast-line from this raster data:using PyPlot, GeoDatasets\nclf() # hide\nlon,lat,data = GeoDatasets.landseamask(;resolution=\'c\',grid=5)\ncontour(lon,lat,data\',[0.5],colors=[[0.2,0.2,0.2]],linewidths=0.5)\ngca().set_aspect(1)\nsavefig(\"landseamask-coastline-plot.png\"); nothing # hide(Image: )"
},

]}
