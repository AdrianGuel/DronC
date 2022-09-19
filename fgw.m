function f=fgw(g,w,tau)
    [kp,kd]=sregion(-g,w,tau);
    f=g.*kd-kp-((g.^2).*D(-g)./N(-g)).*exp(-tau*g);
    
    function val=N(s)
        b1=0.4; b0=6; 
        val=b1.*s+b0;
    end
    function val=D(s)
        a2=0.06; a1=1;a0=6;
        val=a2*s.^2+a1.*s+a0;
    end
end