using CairoMakie
using DelimitedFiles

data1 = readdlm("022_caminhadaclassica1.dat", Float64, skipblanks=true)

fig = Figure(resolution = (1200, 450), fonts = (; regular= "CMU Serif"), fontsize = 20)
ax1 = Axis(fig[1,1]; xlabel = L"N", ylabel = L"\sigma", xlabelsize = 26, 
    ylabelsize = 26, xscale = log10, xminorticksvisible = true, 
    xminorticks = IntervalsBetween(9),  yscale = log10, yminorticksvisible = 
    true, yminorticks = IntervalsBetween(9))

t = 1:1:300
lines!(ax1, data1[:,1], data1[:,2]; color = :black, linewidth = 2)
lines!(ax1, t, sqrt.(t); color = :red, linewidth = 2, linestyle = :dash)
limits!(minimum(data1[:,1]), maximum(data1[:,1]), 1.1*minimum(data1[:,2]), 
                                                        1.1*maximum(data1[:,2]))

data2 = readdlm("022_caminhadaclassica2.dat", Float64, skipblanks=true)
data3 = readdlm("022_caminhadaclassica3.dat", Float64, skipblanks=true)

ax2 = Axis(fig[1,2]; xlabel = L"x", ylabel = L"p(x)", xlabelsize = 26, ylabelsize = 26)
lines!(ax2, data2[:,1], data2[:,2]; color = :black, label = L"p = 0.5")
lines!(ax2, data3[:,1],  data3[:,2]; color = :red, label = L"p = 0.53")
limits!(minimum([data2[:,1]; data3[:,1]]), maximum([data2[:,1]; data3[:,1]]), 
1.1*minimum([data2[:,2]; data3[:,2]]), 1.1*maximum([data2[:,2]; data3[:,2]]))
axislegend("Legend", position = :rt);

save("022_caminhadaclassica.png", fig)