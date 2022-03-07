function [Rings,Normal,Collocation,TERings,TEidx] = generate_rings(panels,isTE)
%GENERATE_RINGS Summary of this function goes here
%   Detailed explanation goes here
N = size(panels,3);
Rings = zeros(4,3,N);
Collocation = zeros(3,N);

for i = 1:N
    A = panels(1,:,i);
    B = panels(2,:,i);
    AD = panels(4,:,i)-A;
    BC = panels(3,:,i)-B;
    
    Rings(1,:,i) = panels(1,:,i) + 0.25*AD;
    Rings(2,:,i) = panels(2,:,i) + 0.25*BC;
    Rings(3,:,i) = panels(2,:,i) + 1.25*BC;
    Rings(4,:,i) = panels(1,:,i) + 1.25*AD;
    
    Collocation(:,i) = ((panels(1,:,i) + 0.75*AD) + (panels(2,:,i) + 0.75*BC))./2';    
end
Normal = laca.panel.panel_normal(Rings);
idx_te = find(isTE);
N_te = length(idx_te);

TERings = zeros(4,3,N_te);
TEidx = [(1:N_te)',idx_te];

panel_dir = panels(4,1,1)-panels(1,1,1);
panel_dir = panel_dir/abs(panel_dir);

for i = 1:N_te
    TERings(1,:,i) = Rings(4,:,idx_te(i));
    TERings(2,:,i) = Rings(3,:,idx_te(i));
    TERings(3,:,i) = Rings(3,:,idx_te(i))+[20 0 0].*panel_dir;
    TERings(4,:,i) = Rings(4,:,idx_te(i))+[20 0 0].*panel_dir;
end

end

