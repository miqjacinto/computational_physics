using CairoMakie
using DelimitedFiles

tab = readdlm("021_autocorrelacao.dat", Float64, skipblanks=true)

lines(tab[:,1], tab[:,2]; color = :black, linewidth = 2, label = L"C(r)",
    axis = (xlabel = L"r", ylabel = L"C(r)", xlabelsize = 26, ylabelsize = 26,
    xscale = log10, xminorticksvisible = true, xminorticks = IntervalsBetween(9)),
    figure = (resolution = (600, 400), fonts = (; regular= "CMU Serif")))

axislegend("Legend", position = :rt);
limits!(minimum(tab[:,1]), maximum(tab[:,1]), 1.1*minimum(tab[:,2]), 
                                                        1.1*maximum(tab[:,2]))
save("021_autocorrelacao.png", current_figure())