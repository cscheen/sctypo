---
title: "Insertion d’illustrations"
date: 2002-04-29
lastmod: 2023-04-28
description: "Création et insertion du contenu graphique d’un projet LaTeX"
images: ["/img/0dfig.png"]
imgAuthor: "Lorenzo Cafaro"
imgWebSite: "Negative Space"
imgURL: "https://negativespace.co/architecture-drawing-ruler-pen/"
type: "prestations"
weight: 4
draft: false
---

L’insertion d’illustrations produites par des programmes tels que
[Adobe Illustrator](https://www.adobe.com/products/illustrator.html
"Page du programme Adobe Illustrator"),
[Adobe Photoshop](https://www.adobe.com/products/photoshop.html
"Page du programme Adobe Photoshop"),
[GIMP](https://www.gimp.org/
"Site du programme libre GIMP"),
[Xfig/Transfig](http://mcj.sourceforge.net/
"Page du programme libre Xfig/Transfig"),
[CorelDRAW](https://www.coreldraw.com/en/product/coreldraw/
"Page du programme CorelDRAW"),&nbsp;etc.,
n’est pas réalisée par le {{< quote "moteur" >}} de composition TeX
lui-même, mais par le pilote DVI (*device independent*) qui convertit la
sortie DVI de LaTeX sous une forme définitive pour la visualisation ou
l’impression (voir page consacrée à la
[production de la version finale](/prestations/production-version-finale/
"Lien vers la page de production de la version finale")
pour plus de détails à propos de la chaîne de production).
Les trois {{< quote "moteurs" >}} plus récents --- pdfTeX, XeTeX et LuaTeX
--- combinent en revanche les fonctions du {{< quote "moteur" >}} de
composition et celles du pilote PDF (*portable document format*).

L’insertion d’illustrations externes nécessite quelques précautions&nbsp;:
1.  il faut indiquer à LaTeX, en général par le biais d’options passées aux
extensions de la famille Graphics, le nom du pilote qui sera utilisé aux
étapes ultérieures de la chaîne de production (par exemple Dvips, Dvipdfmx
ou pdfTeX)&#8239;;
2.  les formats d’illustrations doivent être compatibles avec le pilote
renseigné, ce qui peut impliquer une opération de conversion.
Les pilotes PostScript requièrent des illustrations au format EPS
(PostScript dit *encapsulé*)&#8239;; les pilotes PDF acceptent des
illustrations au format PNG, JPEG, {{< fullcaps "JBIG2" >}} ou PDF
lui-même&#8239;;
3.  les fichiers graphiques insérés doivent incorporer toutes les polices de
caractères qu’ils utilisent, sous la forme de sous-ensembles --- en anglais,
*embedded subsets*&#8239;;
4.  les fichiers graphiques insérés doivent être à haute résolution (au
moins douze points par millimètre à la taille d’impression) et ils ne
doivent en outre pas être affectés de sous-échantillonnage.
Pour les illustrations en couleurs, l’espace de couleurs CMYK devrait être
privilégié.

L’insertion d’illustrations produites par des programmes externes pose
parfois quelques problèmes de portabilité ou d’homogénéité vis-à-vis du
texte principal.
Cependant, on peut aussi utiliser diverses extensions afin de réaliser les
illustrations de manière directe en LaTeX lui-même.
Par ordre croissant de sophistication, on peut mentionner l’environnement
`picture`, les extensions
[Epic](https://ctan.org/pkg/epic
"Page CTAN consacrée à l’extension Epic"),
[Eepic](https://ctan.org/pkg/eepic
"Page CTAN consacrée à l’extension Eepic")
(cette dernière, au détriment de la portabilité) et
[Pict2e](https://ctan.org/pkg/pict2e
"Page CTAN consacrée à l’extension Pict2e"),
et les systèmes
[PiCTeX](https://ctan.org/pkg/pictex
"Page CTAN consacrée au système PiCTeX"),
[MetaPost](https://ctan.org/pkg/metapost
"Page CTAN consacrée au système MetaPost"),
[PSTricks](http://tug.org/PSTricks/main.cgi/
"Site consacré au système PSTricks"),
[XY-pic](https://ctan.org/pkg/xypic
"Page CTAN consacrée au système XY-pic")
et
[PGF/TikZ](https://ctan.org/pkg/pgf
"Page CTAN consacrée au système PGF/TikZ"),
sans compter ceux qui se consacrent à des domaines spécifiques (science,
technologie, musique,&nbsp;etc.).
