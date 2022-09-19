function val=CostF(g,tau)
    wf = abs(fzero(@(w) fgw(g,w,tau),3));
    w=linspace(1e-5,abs(wf),20000);   
    val=v(g,w,tau);
end