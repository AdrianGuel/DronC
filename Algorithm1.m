%Dron paper Carmen Example Proposition8
%Guel Cortez 2022

clearvars
clc
close all

fig=figure('visible','on');
set(fig, 'Position',  [454,239,919,573])
set(gcf,'color','w');
ax1 = subplot(1,2,1);
hold(ax1,'on')
grid(ax1,'on')
xlabel(ax1,'$k_p$','Interpreter','Latex','FontSize', 14)
ylabel(ax1,'$k_d$','Interpreter','Latex','FontSize', 14)
axis(ax1,'square')
axis(ax1,[5.5 6.9 3.9 4.02])

ax2 = subplot(1,2,2);
hold(ax2,'on')
grid(ax2,'on')
xlabel(ax2,'$\sigma$','Interpreter','Latex','FontSize', 14)
ylabel(ax2,'$v(\sigma)$','Interpreter','Latex','FontSize', 14)
axis(ax2,'square')
axis(ax2,[3.8 4.25 1 2])

options = optimoptions('fmincon','Display','iter');%,'Algorithm','sqp');
A = [];
b = [];
Aeq = [];
beq = [];
lb = 3;
ub = 7;
nonlcon = [];
x0 = 3;
tau=9/500;
x = fmincon(@(g) CostF(g,tau),x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
wf = abs(fzero(@(w) fgw(x,w,tau),3));
w=linspace(1e-5,abs(wf),8000);
plot(ax2,x,v(x,w,tau),'bo')
text(ax2,x,v(x,w,tau)+.5, "\sigma =" + x)

gk=3.8;
dg=1e-3;
tau=9/500;
while gk<4.3   
    gk=gk+dg;
    wf = abs(fzero(@(w) fgw(gk,w,tau),3));
    w=linspace(1e-5,abs(wf),8000);    
    plot(ax2,gk,v(gk,w,tau),'k.')
end

wf = abs(fzero(@(w) fgw(x,w,tau),3));
w=linspace(1e-5,abs(wf),8000);    
[kps,kds]=sregion(-x,w,tau);
fill(ax1,kps,kds,[0.8,0.8,0.8])
plot(ax1,kps,kds,'b','LineWidth',2)
[kpg0,kdg0]=K0(x,tau);
kd0=kdg0:1e-3:kds(end);
plot(ax1,region0(-x,kd0,tau),kd0,'r','LineWidth',2)
