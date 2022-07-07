
imm_seg_g(1) = ("RIM-ONE_segment\CBA\glaucoma\");
imm_seg_n(1) = ("RIM-ONE_segment\CBA\normal\");
imm_seg_g(2) = ("RIM-ONE_segment\FCMC\glaucoma\");
imm_seg_n(2) = ("RIM-ONE_segment\FCMC\normal\");
imm_seg_g(3) = ("RIM-ONE_segment\KMC\glaucoma\");
imm_seg_n(3) = ("RIM-ONE_segment\KMC\normal\");
imm_seg_g(4) = ("RIM-ONE_segment\RG\glaucoma\");
imm_seg_n(4) = ("RIM-ONE_segment\RG\normal\");
imm_seg_g(5) = ("RIM-ONE_segment\SP\glaucoma\");
imm_seg_n(5) = ("RIM-ONE_segment\SP\normal\");
imm_seg_g(6) = ("RIM-ONE_segment\TH\glaucoma\");
imm_seg_n(6) = ("RIM-ONE_segment\TH\normal\");


gt_cup_g = ("RIM-ONE_DL_reference_segmentations\glaucoma\Cup\");
gt_cup_n = ("RIM-ONE_DL_reference_segmentations\normal\Cup\");
gt_disc_g = ("RIM-ONE_DL_reference_segmentations\glaucoma\Disc\");
gt_disc_n = ("RIM-ONE_DL_reference_segmentations\normal\Disc\");

c1 = dir(gt_cup_g);
c2 = dir(gt_cup_n);
c3 = dir(gt_disc_g);
c4 = dir(gt_disc_n);
dim = length(imm_seg_g);

J_cup_g = length(c1);
m_c_g = zeros(J_cup_g,6);
J_cup_n = length(c2);
m_c_n = zeros(J_cup_n,6);
J_disc_g = length(c3);
m_d_g = zeros(J_disc_g,6);
J_disc_n = length(c4);
m_d_n = zeros(J_disc_n,6);

for n = 1:dim
    imm_seg_n(n);
    imm_seg_g(n);
    con_g = dir(imm_seg_g(n));
    con_n = dir(imm_seg_n(n));
    
    for j = 3:length(con_g)
        percorso = strcat(imm_seg_g(n),con_g(j).name);
        I1 = imread(percorso);
        percorso = strcat(gt_cup_g,c1(j).name);
        I2 = imread(percorso);
        m_c_g(j,n) = compareBW(I1,I2);

        percorso = strcat(gt_disc_g,c3(j).name);
        I2 = imread(percorso);
        m_d_g(j,n) = compareBW(I1,I2);
    end

    for j = 3:length(con_n)
        percorso = strcat(imm_seg_n(n),con_n(j).name);
        I1 = imread(percorso);
        percorso = strcat(gt_cup_n,c2(j).name);
        I2 = imread(percorso);
        m_c_n(j,n) = compareBW(I1,I2);

        percorso = strcat(gt_disc_n,c4(j).name);
        I2 = imread(percorso);
        m_d_n(j,n) = compareBW(I1,I2);
    end
    
end
