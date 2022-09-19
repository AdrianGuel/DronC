function kp0=region0(g,kd,tau)
kp0=(g*(exp(g*tau)*g + kd*M(g)))/(-M(g));
end