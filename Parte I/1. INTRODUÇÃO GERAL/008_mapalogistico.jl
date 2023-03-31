using CairoMakie
using DelimitedFiles

data = readdlm("008_mapalogistico.dat", Float64, skipblanks=true)

scatter(data[:,1], data[:,2]; markersize = 2, color = :black, axis = (; xlabel =
        L"r", ylabel = L"x_{n \rightarrow \infty}", xlabelsize = 26, 
        ylabelsize = 26), figure = (; resolution = (600,450), fonts = 
        (; regular = "CMU Serif")))

save("008_mapalogistico.png", current_figure())





