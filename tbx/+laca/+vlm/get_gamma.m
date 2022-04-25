function Gamma = get_gamma(V_col,Normal,Normalwash,AIC)
rhs = dot(V_col,Normal)'-V_col(1,:)'.*sin(Normalwash);
Gamma = AIC\rhs;
end

