using CairoMakie
using DelimitedFiles

data = readdlm("010_mediacurva.dat", Float64, skipblanks=true)
mean = readdlm("010_mediacurvaout.dat", Float64, skipblanks=true)

scatter(data[:,1], data[:,2]; markersize = 2, color = :black, axis = (; xlabel =
        L"x", ylabel = L"y(x)", xlabelsize = 26, 
        ylabelsize = 26), figure = (; resolution = (600,450), fonts = 
        (; regular = "CMU Serif")))
lines!(mean[:,1], mean[:,2]; color = :red, linewidth = 2.5, linestyle = :solid)
lines!(mean[:,1], mean[:,3]; color = :green, linewidth = 2.5, linestyle = :solid)

# axislegend("Legend", position = :ct);
limits!(1.1*minimum(data[:,1]), 1.1*maximum(data[:,1]), 
                                1.1*minimum(data[:,2]), 1.1*maximum(data[:,2]))
save("010_mediacurva.png", current_figure())