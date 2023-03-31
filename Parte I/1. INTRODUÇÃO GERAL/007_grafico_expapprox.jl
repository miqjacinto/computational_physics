using CairoMakie
using DelimitedFiles

data1 = readdlm("007_funcaoexp.dat", Float64, skipblanks=true)
data2 = readdlm("007_funcaoexpapprox.dat", Float64, skipblanks=true)

lines(data1[:,1], data1[:,2]; color = :black, linewidth = 2, label = L"e^{x}",
    axis = (xlabel = L"x", ylabel = L"y(x)", xlabelsize = 26, ylabelsize = 26),
    figure = (resolution = (600, 400), fonts = (; regular= "CMU Serif")))
    lines!(data2[:,1], data2[:,2]; color = :red, linewidth = 2, 
    linestyle = :dash, label = L"1 + \sum_{n = 1}^{5} \frac{x^n}{n!}")
axislegend("Legend", position = :lt);

save("007_funcaoexpapprox.png", current_figure())





