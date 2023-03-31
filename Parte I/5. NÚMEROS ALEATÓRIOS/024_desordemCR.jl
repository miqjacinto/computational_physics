using CairoMakie, ColorSchemes
using DelimitedFiles

N = 15000
Z = ["2.0", "4.0", "8.0", "16.0"]
n = length(Z)
nhalf = floor(Int64, length(Z)/2)

cbarPal = :linear_ternary_blue_0_44_c57_n256
cmap = reverse(cgrad(colorschemes[cbarPal], n, categorical = true))

fig = Figure(resolution = (850, 450), fonts = (; regular= "CMU Serif"), 
                                                                 fontsize = 20)

ax1 = Axis(fig[1:n,2]; xlabel = L"r", ylabel = L"C(r)", xlabelsize = 26, 
                                                                ylabelsize = 26)
for i = 1:n

    namefile1 = "024_desordemCR1_N=$(N)_Z=$(Z[i]).dat"
    namefile2 = "024_desordemCR2_N=$(N)_Z=$(Z[i]).dat"
    data1 = readdlm(namefile1, Float64, skipblanks=true)
    data2 = readdlm(namefile2, Float64, skipblanks=true)

    if i == n
        ax = Axis(fig[n,1]; xlabel = L"x", xlabelsize = 26)
        
    elseif i == nhalf
        ax = Axis(fig[nhalf,1]; ylabel = L"N", ylabelsize = 26)
        hidexdecorations!(ax, ticks=false, grid=false)
    else 
        ax = Axis(fig[i,1])
        hidexdecorations!(ax, ticks=false, grid=false)
    end

    lines!(ax, data1[:,1], data1[:,2]; linewidth = 2, color = cmap[i])
    xlims!(minimum(data1[:,1]), maximum(data1[:,1]))
    lines!(ax1, data2[:,1], data2[:,2]; linewidth = 2, color = cmap[i])

end

colgap!(fig.layout, 20)
rowgap!(fig.layout, 10)

save("024_desordemCR.png", current_figure())