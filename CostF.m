function val=CostF(g,tau)
    wf = abs(fzero(@(x) fgw(g,x,tau),1));
    w=linspace(1e-8,wf,20000);   
    val=v(g,w,tau);
end