aa = linspace(0, 2, 5)'
bb  = linspace(-2, 0, 5)'
[aa,bb] = meshgrid(aa, bb);
answer = (aa .+ bb)
mesh(aa,bb,answer);



