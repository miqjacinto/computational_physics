using CairoMakie
using DelimitedFiles

data = readdlm("006_funcaoexp.dat", Float64, skipblanks=true)

lines(data[:,1], data[:,2]; color = "#56B4E9", linewidth = 2, label = L"C(1-e^{-ax})",
    axis = (xlabel = L"x", ylabel = L"y(x)", xlabelsize = 26, ylabelsize = 26),
    figure = (resolution = (600, 400), fonts = (; regular= "CMU Serif")))
axislegend("Legend", position = :rb);

save("006_funcaoexp.png", current_figure())


