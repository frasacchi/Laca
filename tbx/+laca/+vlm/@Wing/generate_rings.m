function generate_rings(obj)
for i= 1:length(obj.Sections)
    obj.Sections{i}.generate_rings();
end
end

