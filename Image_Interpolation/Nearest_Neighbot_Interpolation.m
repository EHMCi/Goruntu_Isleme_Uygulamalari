% En yakin Komsu Aradegerleme Yontemi
%500'e 500 boyutlarinda bir resmin 750`ye 750 boyutlarina cikarilmasi icin
%yazilmis bir algoritmadir. Algoritmada kullanilan yontemin adi En yakin
%Komsu Aradegerlendirme Yontemidir(Nearest neighbor interpolation)
clear all
close all
clc

a = imread('clock.jpg');
imshow(a)
birim_uzunluk = 500/750;
yeni_resim = zeros(750,750);

for renk = 1:3
    for satir = 1:750
        for sutun = 1:750
        satir_500 = round(satir * birim_uzunluk);
        sutun_500 = round(sutun * birim_uzunluk);
        yeni_resim(satir,sutun,renk) = a(satir_500,sutun_500,renk);

        end
    end
end
figure,imshow(uint8(yeni_resim))