function Gamma = get_gamma(V_col,Normal,Normalwash,AIC)
rhs = dot(V_col,Normal)'-V_col(1,:)'.*sin(Normalwash);
if all(rhs==0)
    Gamma = rhs;
else
    Gamma = AIC\rhs;
end
end

