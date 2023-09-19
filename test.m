n1 = 0.1*5+0.4

a1 = sigmod(n1)

a2 = 0.2*a1 + (-1.3)

e1 = error(2,a2)



function a_sig = sigmod(n)
    a_sig = 1/1+exp(1)^-n;
end

function e = error(t, a)
    e = t - a;
end