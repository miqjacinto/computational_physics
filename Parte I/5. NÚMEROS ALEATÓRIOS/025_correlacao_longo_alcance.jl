using CairoMakie
using DelimitedFiles
using FFTW

data = readdlm("025_correlacao_longo_alcance.dat", Float64, skipblanks=true)

fig = Figure(resolution = (1200, 450), fonts = (; regular= "CMU Serif"), fontsize = 20)
ax1 = Axis(fig[1,2]; xlabel = L"N", ylabel = L"\hat{\epsilon}_N", xlabelsize = 26, 
    ylabelsize = 26, xscale = log10, xminorticksvisible = true, 
    xminorticks = IntervalsBetween(9),  yscale = log10, yminorticksvisible = 
    true, yminorticks = IntervalsBetween(9))

datafourier = rfft(data[:,2])
n = length(datafourier)
t = 1:n
datafourier = abs.(datafourier)/n
lines!(ax1, t, datafourier; color = :black, linewidth = 2)
lines!(ax1, t, t.^(-1.5); color = :red, linewidth = 2, linestyle = :dash)
xlims!(1, 10^4)
# create a function to plot the power law
# function powerlaw(x, a, b)
#     return a*x.^b
# end
# fit the power law
# fit = curve_fit(powerlaw, t, datafourier, [1, -1.5])
# plot the power law
# lines!(ax1, t, powerlaw(t, fit.param[1], fit.param[2]); color = :red, linewidth = 2, linestyle = :dash)


ax2 = Axis(fig[1,1]; xlabel = L"N", ylabel = L"\epsilon_N", xlabelsize = 26, ylabelsize = 26)
lines!(ax2, data[:,1], data[:,2]; color = :black, linewidth = 2)
xlims!(minimum(data[:,1]), maximum(data[:,1]))

save("025_correlacao_longo_alcance.png", fig)