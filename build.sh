#!/usr/bin/env bash

now=$(date +"%m-%d-%Y, "%T"")

echo " "
echo "------------- macesdev foundation -------------"
echo "---------------- mdkn@23.1.4.7 ---------------- "
echo " "

echo "◉ - Dosyalar güncelleniyor.."
git add . 
git add -A 
echo "✔ - Dosyalar güncellendi!"
echo "◉ - Uzak değişiklikler ekleniyor.."
git fetch 
echo "✔ - Değişiklikler eklendi!"
echo "◉ - Dallar güncelleniyor.."
git pull
echo "✔ - Dallar güncellendi!"
echo "◉ - Değişiklikler temin ediliyor.."
git commit -m "mdev.mdkn@latest - $now" 
echo "✔ - Değişilikler eklendi!"
echo "◉ - Güncelleniyo.."
git push -f origin main 
echo "✔ - Güncellendi!"


echo " "
echo "Güncelleme başarılı, mdev.cloud.build çalıştırılmak üzere sevk ediliyor.."
echo " "