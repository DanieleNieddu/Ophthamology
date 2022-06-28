
crop_size = [10 10 799 799];
cartella(1) = ("new_crop\DrishtiGS\drishti-dataset\Normali\");
cartella(2) = ("new_crop\DrishtiGS\drishti-dataset\Glaucoma\");
cartella(3) = ("new_crop\Messidor\Base14\");
cartella(4) = ("new_crop\Messidor\Base24\");
cartella(5) = ("new_crop\Messidor\Base34\");
cartella(6) = ("RIM-ONE_DL_images\partitioned_by_hospital\test_set\glaucoma\");
cartella(7) = ("RIM-ONE_DL_images\partitioned_by_hospital\test_set\normal\");
cartella(8) = ("RIM-ONE_DL_images\partitioned_by_hospital\training_set\glaucoma\");
cartella(9) = ("RIM-ONE_DL_images\partitioned_by_hospital\training_set\normal\");
n = 3
%for n = 1:length(cartella)
    contenuto = dir(cartella(n));
    j = length(contenuto);
    
    for i = 3:j
      percorso = strcat(cartella(n) , contenuto(i).name);
      
      SP= strcat('nuovo\',cartella(n) ,'SP_', contenuto(i).name);
      CBA= strcat('Risultati\',cartella(n) ,'CBA_', contenuto(i).name);
      TH= strcat('Risultati\',cartella(n) ,'TH_',contenuto(i).name);
      RG=strcat('Risultati\',cartella(n) ,'RG_', contenuto(i).name);
      KMC= strcat('Risultati\',cartella(n) ,'KMC_' ,contenuto(i).name);
      FCMC=strcat('Risultati\',cartella(n) ,'FCMC', contenuto(i).name);
      I = imread(percorso);
      A1 = superpixelClassification(I,60);
      A2 = im2gray(A1);
      B = tresholding(A2);
      imwrite(B,SP);
      %A2 = contour_Based_App(I,800);
      %imwrite(A2,CBA);
      %A3 = tresholding(im2gray(I));
      %imwrite(A3,TH);
      %B = im2double(im2gray(I));
      %A4 = regiongrowing(B,20,20,0.2);
      %imwrite(A4,RG);
      %A5 = kMeansClustering(I,2);
      %imwrite(A5,KMC);
      %A6 = fuzzyCMeansClustering(I);
      %imwrite(A6,FCMC);
    end
%end