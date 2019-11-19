#=

=#

"""
    horizontal_slice(x3D, grd, iz)

Returns the filled contour plot of tracer x3D at depth level iz
"""
function horizontal_slice(x3D, grd, iz)
    lon, lat = grd.lon .|> ustrip, grd.lat .|> ustrip
    return contourf(lon, lat, view(x3D,:,:,iz)')
end
function horizontal_slice(x::Vector, grd, iz) 
    x3D = rearrange_into_3Darray(x, grd)
    return horizontal_slice(x3D, grd, iz)
end


"""
    profile(x3D, grd, iy, ix)

Returns the profile of x3D at (lat,lon) indices (iy,ix)
"""
function profile(x3D, grd, iy, ix)
    depth = grd.depth .|> ustrip
    return plot(view(x3d,iy,ix,:), depth, yflip=true)
end
function profile(x::Vector, grd, iy, ix)
    x3D = rearrange_into_3Darray(x, grd)
    return profile(x3D, grd, iy, ix)
end


"""
    zonal_slice(x3D, grd, ix)

Returns the filled contour plot of tracer x3D at longitude level ix
"""
function zonal_slice(x3D, grd, ix)
    depth, lat = grd.depth .|> ustrip, grd.lat .|> ustrip
    return contourf(lat, depth, view(x3D,:,ix,:)')
end
function zonal_slice(x::Vector, grd, ix) 
    x3D = rearrange_into_3Darray(x, grd)
    return zonal_slice(x3D, grd, ix)
end
