#!/bin/bash
mkdir -p /usr/share/fonts/source-han
cd /usr/share/fonts/source-han; mkdir -p sans; cd sans
wget https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansSC.zip -e use_proxy=on -e http_proxy=${http_proxy}
unzip SourceHanSansSC.zip; rm SourceHanSansSC.zip
cd /usr/share/fonts/source-han; mkdir -p serif; cd serif
wget https://github.com/adobe-fonts/source-han-serif/releases/download/2.001R/14_SourceHanSerifCN.zip -e use_proxy=on -e http_proxy=${http_proxy}
unzip 14_SourceHanSerifCN.zip; rm 14_SourceHanSerifCN.zip;
cd /usr/share/fonts/source-han; mkdir -p mono; cd mono
wget https://github.com/adobe-fonts/source-han-mono/releases/download/1.002/SourceHanMono.ttc -e use_proxy=on -e http_proxy=${http_proxy}
chmod -R 755 /usr/share/fonts/source-han
cd /usr/share/fonts/source-han
mkfontscale
mkfontdir
fc-cache -fv
