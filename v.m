function val= v(g,w,tau)
    [kpg0,kdg0]=K0(g,tau);
    u=[kpg0;kdg0];
    [kpw,kdw]=sregion(-g,w,tau);
    v=[kpw;kdw];
    [dkp,dkd]=Kgradient(g,w,tau);
    f=dkp.^2+dkd.^2;
    val=trapz(f,w)+norm(v(:,end)-u,2)^2;
end