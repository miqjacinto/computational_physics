using CairoMakie
using DelimitedFiles

data = readdlm("020_potencianumaleatorio.dat", Float64, skipblanks=true)

fig = Figure(resolution = (1200, 450), fonts = (; regular= "CMU Serif"), fontsize = 20)
ax1 = Axis(fig[1,1]; xlabel = L"x", ylabel = L"N", xlabelsize = 26, ylabelsize = 26)
scatter!(ax1, data[:,2], data[:,1]; markersize = 2, color = :black)
ax2 = Axis(fig[1,2]; xlabel = L"x", ylabel = L"p(x)", xlabelsize = 26, ylabelsize = 26)
hist!(ax2, data[:,2]; bins = 50, color = :white, strokewidth = 1.5,
                            normalization = :pdf, strokecolor = :black)
n = -3
np1 = n + 1
x1 = 1.5
x0 = 0.5
C = x1^np1 - x0^np1
C = np1 / C
dx = 0.01
x = x0:dx:x1
lines!(ax2, x, C*x.^n ; color = :red, linestyle = :dash)

save("020_potencianumaleatorio.png", current_figure())