function image = labelConverter(A)
image = ones(255,255);
image(string(A) == "Background") = 0;
end