%Bicubic Interpolation Algortihm
%Onur HOŞGÖR

clear all

clc
tic
a =imread('clock.jpg');


birim_uzunluk = 500/5000;
yeni_resim = zeros(5000,5000); % 100 kat buyutme


for renk = 1:3
    for satir = 20: 4980 %kenarlardan 20piksel bilerek birakilmistir. Bu degerleri birakma amaci demo uygulamada kodun karmasikligini azaltmaktir.
        for sutun = 20: 4980
   
         V_x = satir * birim_uzunluk;
         V_y = sutun * birim_uzunluk;
         En_yakin_x = round(V_x);
         x = En_yakin_x;
         En_yakin_y = round(V_y);
         y = En_yakin_y;
         
         if (V_x > En_yakin_x) && (V_y > En_yakin_y)
            V1 = ((3-abs(V_y-(y-1)))/8)*a(x-1,y-1,renk) + ((3-abs(V_y-(y)))/8)*a(x-1,y,renk) + ((3-abs(V_y-(y+1)))/8)*a(x-1,y+1,renk) + ((3-abs(V_y-(y+2)))/8)*a(x-1,y+2,renk);
            V2 = ((3-abs(V_y-(y-1)))/8)*a(x,y-1,renk)   + ((3-abs(V_y-(y)))/8)*a(x,y,renk)   + ((3-abs(V_y-(y+1)))/8)*a(x,y+1,renk)   + ((3-abs(V_y-(y+2)))/8)*a(x,y+2,renk);
            V3 = ((3-abs(V_y-(y-1)))/8)*a(x+1,y-1,renk) + ((3-abs(V_y-(y)))/8)*a(x+1,y,renk) + ((3-abs(V_y-(y+1)))/8)*a(x+1,y+1,renk) + ((3-abs(V_y-(y+2)))/8)*a(x+1,y+2,renk); 
            V4 = ((3-abs(V_y-(y-1)))/8)*a(x+2,y-1,renk) + ((3-abs(V_y-(y)))/8)*a(x+2,y,renk) + ((3-abs(V_y-(y+1)))/8)*a(x+2,y+1,renk) + ((3-abs(V_y-(y+2)))/8)*a(x+2,y+2,renk);
            V  = ((3-abs(V_x-(x-1)))/8)*V1              + ((3-abs(V_x-(x)))/8)*V2            + ((3-abs(V_x-(x+1)))/8)*V3              + ((3-abs(V_x-(x+2)))/8)*V4;
         elseif (V_x < En_yakin_x) && (V_y > En_yakin_y)
            V1 = ((3-abs(V_y-(y-1)))/8)*a(x-2,y-1,renk) + ((3-abs(V_y-(y)))/8)*a(x-2,y,renk) + ((3-abs(V_y-(y+1)))/8)*a(x-2,y+1,renk) + ((3-abs(V_y-(y+2)))/8)*a(x-2,y+2,renk);
            V2 = ((3-abs(V_y-(y-1)))/8)*a(x-1,y-1,renk) + ((3-abs(V_y-(y)))/8)*a(x-1,y,renk) + ((3-abs(V_y-(y+1)))/8)*a(x-1,y+1,renk) + ((3-abs(V_y-(y+2)))/8)*a(x-1,y+2,renk); 
            V3 = ((3-abs(V_y-(y-1)))/8)*a(x,y-1,renk)   + ((3-abs(V_y-(y)))/8)*a(x,y,renk)   + ((3-abs(V_y-(y+1)))/8)*a(x,y+1,renk)   + ((3-abs(V_y-(y+2)))/8)*a(x,y+2,renk); 
            V4 = ((3-abs(V_y-(y-1)))/8)*a(x+1,y-1,renk) + ((3-abs(V_y-(y)))/8)*a(x-2,y,renk) + ((3-abs(V_y-(y+1)))/8)*a(x+1,y+1,renk) + ((3-abs(V_y-(y+2)))/8)*a(x+1,y+2,renk);
            V  = ((3-abs(V_x-(x-2)))/8)*V1              + ((3-abs(V_x-(x-1)))/8)*V2          + ((3-abs(V_x-(x)))/8)*V3                + ((3-abs(V_x-(x+1)))/8)*V4;
             
         elseif (V_x > En_yakin_x) && (V_y < En_yakin_y) 
            V1 = ((3-abs(V_y-(y-2)))/8)*a(x-1,y-2,renk) + ((3-abs(V_y-(y-1)))/8)*a(x-1,y-1,renk) + ((3-abs(V_y-(y)))/8)*a(x-1,y,renk) + ((3-abs(V_y-(y+1)))/8)*a(x-1,y+1,renk);
            V2 = ((3-abs(V_y-(y-2)))/8)*a(x,y-2,renk)   + ((3-abs(V_y-(y-1)))/8)*a(x,y-1,renk)   + ((3-abs(V_y-(y)))/8)*a(x,y,renk)   + ((3-abs(V_y-(y+1)))/8)*a(x,y+1,renk);
            V3 = ((3-abs(V_y-(y-2)))/8)*a(x+1,y-2,renk) + ((3-abs(V_y-(y-1)))/8)*a(x+1,y-1,renk) + ((3-abs(V_y-(y)))/8)*a(x+1,y,renk) + ((3-abs(V_y-(y+1)))/8)*a(x+1,y+1,renk); 
            V4 = ((3-abs(V_y-(y-2)))/8)*a(x+2,y-2,renk) + ((3-abs(V_y-(y-1)))/8)*a(x+2,y-1,renk) + ((3-abs(V_y-(y)))/8)*a(x+2,y,renk) + ((3-abs(V_y-(y+1)))/8)*a(x+2,y+1,renk);
            V  = ((3-abs(V_x-(x-1)))/8)*V1              + ((3-abs(V_x-(x)))/8)*V2                + ((3-abs(V_x-(x+1)))/8)*V3          + ((3-abs(V_x-(x+2)))/8)*V4;
             
         elseif (V_x < En_yakin_x) && (V_y < En_yakin_y)    
            V1 = ((3-abs(V_y-(y-2)))/8)*a(x-2,y-2,renk) + ((3-abs(V_y-(y-1)))/8)*a(x-2,y-1,renk) + ((3-abs(V_y-(y)))/8)*a(x-2,y,renk)   + ((3-abs(V_y-(y+1)))/8)*a(x-2,y+1,renk);
            V2 = ((3-abs(V_y-(y-2)))/8)*a(x-1,y-2,renk) + ((3-abs(V_y-(y-1)))/8)*a(x-1,y-1,renk) + ((3-abs(V_y-(y)))/8)*a(x-1,y,renk)   + ((3-abs(V_y-(y+1)))/8)*a(x-1,y+1,renk); 
            V3 = ((3-abs(V_y-(y-2)))/8)*a(x,y-2,renk)   + ((3-abs(V_y-(y-1)))/8)*a(x,y-1,renk)   + ((3-abs(V_y-(y)))/8)*a(x,y,renk)     + ((3-abs(V_y-(y+1)))/8)*a(x,y+1,renk); 
            V4 = ((3-abs(V_y-(y-2)))/8)*a(x+1,y-2,renk) + ((3-abs(V_y-(y-1)))/8)*a(x-2,y-1,renk) + ((3-abs(V_y-(y)))/8)*a(x+1,y,renk)   + ((3-abs(V_y-(y+1)))/8)*a(x+1,y+1,renk);
            V  = ((3-abs(V_x-(x-2)))/8)*V1              + ((3-abs(V_x-(x-1)))/8)*V2              + ((3-abs(V_x-(x)))/8)*V3              + ((3-abs(V_x-(x+1)))/8)*V4;   
         elseif (V_x == En_yakin_x) && (V_y == En_yakin_y)
            V = a(V_x,V_y,renk); 
         end    
         yeni_resim(satir,sutun,renk) =V;
            
         
        end
    end
end
figure,imshow(uint8(yeni_resim))
toc