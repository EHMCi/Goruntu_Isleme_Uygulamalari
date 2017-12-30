% Cift Dogrusal Aradegerlendirme
%500'e 500 boyutlarinda bir resmin 750`ye 750 boyutlarina cikarilmasi icin
%yazilmis bir algoritmadir. Algoritmada kullanilan yontemin adi Cift
%Dogrusal Aradegerlendirme Yontemidir (Bilinear interpolation)
clear all
close all
clc
format long
a = imread('clock.jpg');
imshow(a)
birim_uzunluk = 500/750;
b = ceil(5.40)
c = floor(5.40)
yeni_resim = zeros(750,750);
for renk = 1:3
    for satir = 1:750
        for sutun = 1:750
            
         V_x = satir * birim_uzunluk;
         V_y = sutun * birim_uzunluk; 
         x2 = ceil(V_x);
         x1 = floor(V_x);
         y2 = ceil(V_y);
         y1 = floor(V_y);
         if (y2 == y1)
             y2 = V_y+1;
             y1 = V_y-1;
         end
         if (x1 == x2)
             x1 = V_x-1;
             x2 = V_x+1;
         end
         
         if(x1~=0)&&(y1~=0)  
         if((x2~=501)&&(y2~=501))
            v1 = (((x2 - V_x)/(x2 - x1))*(a(x1,y2,renk))) + (((V_x - x1)/(x2 - x1)) * (a(x2,y2,renk)));
            v2 = (((x2 - V_x)/(x2 - x1))*(a(x1,y1,renk))) + (((V_x - x1)/(x2 - x1)) * (a(x2,y1,renk)));
         
             V = (((y2 - V_y)/(y2 - y1))*v1) + (((V_y - y1)/(y2 - y1))*v2);
         
             yeni_resim(satir,sutun,renk) = V;
         end
         end
        % elseif(x1 == 0)
       %      yeni_resim(satir,sutun,renk) = a(1,,renk) 
        %satir_500 = round(satir * birim_uzunluk);
        %sutun_500 = round(sutun * birim_uzunluk);
        %yeni_resim(satir,sutun,renk) = a(satir_500,sutun_500,renk);

        end
    end
end
figure,imshow(uint8(yeni_resim))
