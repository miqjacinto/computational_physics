using CairoMakie
using DelimitedFiles

data = readdlm("005.dat", ',', Float64, skipblanks=true)

lines(data[:,1], data[:,2]; color = :black, linewidth = 2, linestyle = :dashdot, label = L"x+1",
    figure = (resolution = (600, 400), backgroundcolor = "#765898",
        fonts = (; regular = "CMU Serif")),
    axis = (xlabel = L"x", ylabel = L"y", backgroundcolor = :white,
        xlabelsize = 22, ylabelsize = 22))
axislegend("legend", position = :lt)

save("005_reta.png", current_figure())





