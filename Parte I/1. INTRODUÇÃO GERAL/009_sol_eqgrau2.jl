using CairoMakie
using DelimitedFiles

data = readdlm("009_sol_eqgrau2.dat", Float64, skipblanks=true)

lines(data[:,1], data[:,2]; color = :black, linewidth = 2, label = L"ax^2 + bx + c",
    axis = (xlabel = L"x", ylabel = L"y(x)", xlabelsize = 26, ylabelsize = 26),
    figure = (resolution = (600, 400), fonts = (; regular= "CMU Serif")))

y = zeros(length(data[:,1]))
lines!(data[:,1], y; color = :red, linewidth = 2, linestyle = :dashdot)

axislegend("Legend", position = :ct);
limits!(minimum(data[:,1]), maximum(data[:,1]), minimum(data[:,2]), maximum(data[:,2]))
save("009_sol_eqgrau2.png", current_figure())