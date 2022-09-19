function sg=M(s)
b1=0.4; b0=6; a2=0.06; a1=1;a0=6;
sg=(b1.*s+b0)./(a2*s.^2+a1.*s+a0);
end