%Dron paper Carmen Example Proposition8
%Guel Cortez 2022

clearvars
clc
close all

fig=figure('visible','on');
set(fig, 'Position',  [454,239,919,573])
set(gcf,'color','w');
ax1 = axes();
hold(ax1,'on')
grid(ax1,'on')
%xlabel(ax1,'$k_p$','Interpreter','Latex','FontSize', 14)
%ylabel(ax1,'$k_d$','Interpreter','Latex','FontSize', 14)
xlabel(ax1,'$\sigma$','Interpreter','Latex','FontSize', 14)
ylabel(ax1,'$v(\sigma)$','Interpreter','Latex','FontSize', 14)
axis(ax1,'square')
%axis(ax1,[0 10 3 7])

gk=3;gk1=0; 
dg=1e-2;
tau=0.018;
tol=1e-8;
error=1;

while gk<5 && error>tol  
    gk1=gk+dg;
    wf = abs(fzero(@(w) fgw(gk,w,tau),3));
    w=linspace(1e-5,abs(wf),8000);
    wfk1 = abs(fzero(@(w) fgw(gk1,w,tau),3));
    wk1=linspace(1e-5,abs(wfk1),8000);    
    error=abs((v(gk1,wk1,tau)-v(gk,w,tau))/v(gk1,wk1,tau));
    gk=gk1;
    
    %[kps,kds]=sregion(-gk,w,tau);
    %plot(ax1,kps,kds,'b')
    %[kpg0,kdg0]=K0(gk,tau);
    %kd0=kdg0:0.1:kds(end);
    %plot(ax1,region0(-gk,kd0,tau),kd0,'r')
    plot(ax1,gk,v(gk,w,tau),'k.')
    %hText=text(ax1,6, 3.5, "error =" + error);
    pause(0.01)
    %delete(hText);
end
disp(gk)