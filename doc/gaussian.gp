# Plot Gauss curve with default parameters of Enfuse

load "config.gp"

Mu = 0.5
Sigma = 0.2
Gaussian(Y) = exp(-0.5 * ((Y - Mu) / Sigma)**2)

set xlabel "Y"
set xtics 0.2
set ytics 0.2

set terminal unknown
plot [Y = 0:1] Gaussian(Y)

set output "gaussian.txt"
set terminal dumb Dumb_Width Dumb_Height enhanced
replot

set output "gaussian.png"
set terminal png font FreeSans 10 size Png_Width, Png_Height enhanced
replot

set output "gaussian.eps"
set terminal postscript eps enhanced
replot

# Newer Gnuplots have a "pdf" terminal.
set output "| ps2pdf -dEPSCrop - gaussian.pdf"
set terminal postscript eps enhanced
replot