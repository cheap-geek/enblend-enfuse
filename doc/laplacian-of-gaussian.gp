# Plot radial component of Laplacian-of-Gaussian

load "config.gp"

LaplacianOfGaussian(R, Sigma) = \
    ((R**2 / (2.0 * Sigma**2)) - 1.0) * \
    exp(-(R**2 / (2.0 * Sigma**2))) / \
    (pi * Sigma**4)

set key bottom right
set grid
set xlabel "R"
#set xtics 0.2
set ylabel "k(R)"
#set ytics 0.2

set terminal unknown
plot \
    [R = 0:2] \
    LaplacianOfGaussian(R, 0.5)

set output "laplacian-of-gaussian.txt"
set terminal dumb Dumb_Width Dumb_Height enhanced
replot

set output "laplacian-of-gaussian.png"
set terminal png font FreeSans 10 size Png_Width, Png_Height enhanced
replot

set output "laplacian-of-gaussian.eps"
set terminal postscript eps enhanced
replot

# Newer Gnuplots have a "pdf" terminal.
set output "| ps2pdf -dEPSCrop - laplacian-of-gaussian.pdf"
set terminal postscript eps enhanced
replot
