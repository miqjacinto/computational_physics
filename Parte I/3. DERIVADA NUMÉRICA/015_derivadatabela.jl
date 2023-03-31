using CairoMakie
using DelimitedFiles

tab = readdlm("015_tabeladados.dat", Float64, skipblanks=true)
dtab = readdlm("015_derivadatabela.dat", Float64, skipblanks=true)

lines(tab[:,1], tab[:,2]; color = :black, linewidth = 2, label = L"y(x)",
    axis = (xlabel = L"x", ylabel = L"y(x)", xlabelsize = 26, ylabelsize = 26),
    figure = (resolution = (600, 400), fonts = (; regular= "CMU Serif")))

lines!(dtab[:,1], dtab[:,2]; color = :red, linewidth = 2, linestyle = :dashdot,
        label = L"y'(x)")

axislegend("Legend", position = :rb);
limits!(minimum(tab[:,1]), maximum(tab[:,1]), 1.1*minimum(tab[:,2]), 
                                                        1.1*maximum(tab[:,2]))
save("015_derivadatabela.png", current_figure())