using CairoMakie
using DelimitedFiles

data = readdlm("023_histogramanormalizado.dat", Float64, skipblanks=true)

fig = Figure(resolution = (1200, 450), fonts = (; regular= "CMU Serif"), fontsize = 20)
ax1 = Axis(fig[1,1]; xlabel = L"x", ylabel = L"N", xlabelsize = 26, ylabelsize = 26)
ax2 = Axis(fig[2,1]; xlabel = L"x", ylabel = L"N", xlabelsize = 26, ylabelsize = 26)
scatter!(ax1, data[:,2], data[:,1]; markersize = 2, color = :blue)
scatter!(ax2, data[:,3], data[:,1]; markersize = 2, color = :red)
ax3 = Axis(fig[1:2,2]; xlabel = L"x", ylabel = L"p(x)", xlabelsize = 26, ylabelsize = 26)
hist!(ax3, data[:,2]; bins = 50, strokewidth = 1.5, strokecolor = :blue,
                            normalization = :pdf, color = (:blue, 0.05))
hist!(ax3, data[:,3]; bins = 50, strokewidth = 1.5, strokecolor = :red,
                            normalization = :pdf, color = (:red, 0.05))

xlims!(minimum([data[:,2]; data[:,3]]), maximum([data[:,2]; data[:,3]]))
 save("023_histogramanormalizado.png", current_figure())