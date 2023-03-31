using CairoMakie
using DelimitedFiles

data = readdlm("019_gaussianonumaleatorio.dat", Float64, skipblanks=true)

fig = Figure(resolution = (1200, 450), fonts = (; regular= "CMU Serif"), fontsize = 20)
ax1 = Axis(fig[1,1]; xlabel = L"r", ylabel = L"N", xlabelsize = 26, ylabelsize = 26)
scatter!(ax1, data[:,2], data[:,1]; markersize = 2, color = :black)
ax2 = Axis(fig[1,2]; xlabel = L"r", ylabel = L"Count", xlabelsize = 26, ylabelsize = 26)
hist!(ax2, data[:,2]; bins = 50, color = :white, strokewidth = 1.5,
                                    normalization = :none, strokecolor = :black)

save("019_gaussianonumaleatorio.png", current_figure())