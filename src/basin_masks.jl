"""
    basin_masks()

Obtain ocean basin masks as a function of lat, lon, and depth, from
https://iridl.ldeo.columbia.edu/SOURCES/.NOAA/.NODC/.WOA09/.Masks/.basin/index.html#info .
See this URL for the key mapping integers to basin names.

Returns an `NCDatasets.NCDataset` object from `NCDatasets.jl`.
"""
function basin_masks()

    # Specify the location of the data.
    url = "https://iridl.ldeo.columbia.edu/SOURCES/.NOAA/.NODC/.WOA09/.Masks/.basin/data.nc"
    @debug "url for basin masks: $url"

    # Download the data if needed.
    @RemoteFile(basin_masks, url)
    download(basin_masks)

    # Load the data using NCDatasets.jl.
    return NCDataset(path(basin_masks))
end
