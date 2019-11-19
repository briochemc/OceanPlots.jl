



function interactive_horizontal_slice(x, grd)
    lon, lat = grd.lon |> ustrip, grd.lat |> ustrip
    x_3D = rearrange_into_3Darray(x, grid)
    GR.figure(figsize=(10,5))
    @manipulate for iz in 1:size(grd)[3]
        GR.xlim([0,360])
        GR.title(string(title, " at $(AIBECS.round(grd.depth[iz])) depth"))
        GR.contourf(lon, lat, x_3D[:,:,iz]')
    end
end

function interactive_profile(x, grd)
    lon, lat, depth = grd.lon |> ustrip, grd.lat |> ustrip, grd.depth |> ustrip
    x_3D = rearrange_into_3Darray(x, grid)
    GR.figure(figsize=(10,5))
    @manipulate for x in 1:size(grd)[3]
    end
end


