function perc = compareBW (Imm1,Imm2)

perc = 0;
same = 0;

if size(Imm1) == size(Imm2)
    [x,y] = size(Imm1);
else 
    x = 0;
    y = 0;
end

for i = 1:x
    for j = 1:y
        if (Imm1(i,j) == Imm2(i,j))
            same = same+1;
        end
    end
end

perc = (same/(x*y))*100; 




    