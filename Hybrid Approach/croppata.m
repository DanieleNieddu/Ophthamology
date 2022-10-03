crop_size = [10 10 799 799];
cartella(1) = ("DrishtiGS\drishti-dataset\Normali\");
cartella(2) = ("DrishtiGS\drishti-dataset\Glaucoma\");
cartella(3) = ("Messidor\Base14");
cartella(4) = ("Messidor\Base24");
cartella(5) = ("Messidor\Base34");

for n = 1:length(cartella)
    contenuto = dir(cartella(n));
    j = length(contenuto);
    
    for i = 3:j
      percorso = strcat(cartella(n) , contenuto(i).name);
      nuovo_percorso = strcat('croppate\',percorso);
      I = imread(percorso);
      k = imcrop(I,crop_size);
      imwrite(k,nuovo_percorso);
    end
end


