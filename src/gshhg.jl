
function seg(coord::Vector{Vector{Vector{Vector{Float64}}}})
    @assert length(coord) == 1
    @assert length(coord[1]) == 1
    segcoord = coord[1][1];
end

function seg(coord::Vector{Vector{Vector{Float64}}})
    @assert length(coord) == 1
    segcoord = coord[1];
end


function gshhg(io::IO)
    handle = read(io, Shapefile.Handle)

    segments = NTuple{2,Vector{Float64}}[]
    #Channel(ctype = NTuple{2,Vector{Float64}}) do channel
    #Channel() do channel
        for i = 1:length(handle.shapes)
            segcoord = seg(GeoInterface.coordinates(handle.shapes[i]))

            seglen = length(segcoord)

            segment = (Vector{Float64}(undef,seglen),Vector{Float64}(undef,seglen))
            for l = 1:seglen
                segment[1][l] = segcoord[l][1]
                segment[2][l] = segcoord[l][2]
            end

            push!(segments,segment)
            #put!(channel,segment)

        end
    #end
    return segments
end

function findfile(dir::ZipFile.Reader, name)
    for f in dir.files
        if f.name == name
            return f
        end
    end
    nothing
end

function gshhgload(fname::AbstractString)
    @debug "fname $fname"
    @RemoteFile(gshhg_shp, "http://www.soest.hawaii.edu/pwessel/gshhg/gshhg-shp-2.3.7.zip")
    download(gshhg_shp)
    zip = ZipFile.Reader(path(gshhg_shp))

    io = findfile(zip,fname)
    # does not work
    # tmp = gshhg(io)
    data = read(io);
    close(zip)
    return gshhg(IOBuffer(data))
end

# load a single level

"""
    segments = gshhg(res,level::Integer)

A Global Self-consistent, Hierarchical, High-resolution Geography Database (about 150 Mb), https://www.soest.hawaii.edu/pwessel/gshhg/.
The GSHHG is released under the GNU Lesser General Public License (Version 3).

Wessel, P., and W. H. F. Smith, A Global Self-consistent, Hierarchical, High-resolution Shoreline Database, J. Geophys. Res., 101, 8741-8743, 1996.

Resolution is one of the following:

f: Full resolution
h: High resolution
i: Intermediate resolution
l: Low resolution
c: Crude resolution

The shoreline data are distributed in 6 levels:

Level 1: Continental land masses and ocean islands, except Antarctica.
Level 2: Lakes
Level 3: Islands in lakes
Level 4: Ponds in islands within lakes
Level 5: Antarctica based on ice front boundary.
Level 6: Antarctica based on grounding line boundary.


"""
gshhg(res,level::Integer) = gshhgload("GSHHS_shp/$(res)/GSHHS_$(res)_L$(level).shp")


"""
The river database come with 11 levels:

Level  1: Double-lined rivers (river-lakes).
Level  2: Permanent major rivers.
Level  3: Additional major rivers.
Level  4: Additional rivers.
Level  5: Minor rivers.
Level  6: Intermittent rivers - major.
Level  7: Intermittent rivers - additional.
Level  8: Intermittent rivers - minor.
Level  9: Major canals.
Level 10: Minor canals.
Level 11: Irrigation canals.
"""
WDBII_river(res,level::Integer) = gshhgload("WDBII_shp/$(res)/WDBII_river_$(res)_L$(@sprintf("%02d",level)).shp")

"""
The political boundary data come in 3 levels:

Level 1: National boundaries.
Level 2: Internal (state) boundaries for the 8 largest countries only.
Level 3: Maritime boundaries.
"""
WDBII_border(res,level::Integer) = gshhgload("WDBII_shp/$(res)/WDBII_border_$(res)_L$(level).shp")

# load multiple levels
gshhg(res,levels::AbstractArray{<:Integer}) = reduce(vcat,gshhg.(res,levels))
WDBII_river(res,levels::AbstractArray{<:Integer}) = reduce(vcat,WDBII_river.(res,levels))
WDBII_boarder(res,levels::AbstractArray{<:Integer}) = reduce(vcat,WDBII_river.(res,levels))
