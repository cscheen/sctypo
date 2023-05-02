---
title: "Production de la version finale"
date: 2002-04-29
lastmod: 2023-04-28
description: "Emploi du moteur de composition selon les règles de l’art"
images: ["/img/0ffig.png"]
imgAuthor: "Pierre Bamin"
imgWebSite: "Unsplash/@bamin"
imgURL: "https://unsplash.com/fr/photos/PoqnZZioqOs"
type: "prestations"
weight: 6
draft: false
---

{{< contents >}}

La plupart des documents sont aujourd’hui préparés et imprimés à partir de
fichiers
[PDF](https://www.adobe.com/devnet/pdf/pdf_reference.html
"Référence et spécification du format PDF")
(*portable document format*) soumis par une voie électronique.
Il est important que ces documents remplissent les conditions de production
requises par la chaîne éditoriale et l’impression professionnelle.
Ce n’est pas parce qu’un document semble correct au terminal ou sur le
périphérique local d’impression de l’auteur qu’il convient pour ces
dernières.

En général, les documents peuvent être fournis au format PDF ou
[PostScript](https://www.adobe.com/products/postscript.html
"Référence du langage PostScript").
Les deux sont acceptables, pour autant que le fichier satisfasse aux
conditions suivantes, à chaque étape du processus de fabrication --- ce qui
implique le système LaTeX et ses {{< quote "satellites" >}}&nbsp;:
1.  toutes les polices de caractères utilisées dans le document doivent être
incorporées dans le fichier PDF ou PostScript, sous la forme de
sous-ensembles --- en anglais, *embedded subsets*.
Cette condition garantit une impression conforme aux intentions de
l’auteur&#8239;;
2.  aucune police de caractères de type&nbsp;3 (police *bitmap* PK) ne doit
être utilisée.
Il faut leur préférer les polices PostScript de type&nbsp;1 disponibles.
Quand on essaie de produire un fichier PDF à partir de documents qui
présentent des polices de type&nbsp;3, le résultat manque en effet de
netteté avec les versions du programme Adobe Reader antérieures à la
version&nbsp;6 parue au milieu de l’année&nbsp;2003&#8239;;
3.  toutes les images incorporées doivent être des fichiers PostScript
encapsulés (EPS) ou des fichiers PDF à haute résolution (au moins douze
points par millimètre à la taille d’impression) et non comprimés.
On ne parle pas ici de compression sans perte, mais de l’absence de
sous-échantillonnage.
Dans le cas des images en couleurs, l’espace de couleurs CMYK devrait être
privilégié.

Il est important que les images insérées comportent elles-mêmes toutes les
polices de caractères utilisées, et qu’en outre elles ne soient pas
affectées de sous-échantillonnage ni de compression avec perte.

Les {{< quote "moteurs" >}}
[TeX](https://www-cs-faculty.stanford.edu/~knuth/
"Page personnelle du professeur Donald E. Knuth, créateur du moteur TeX"),
[pdfTeX](http://www.tug.org/applications/pdftex/
"Site du moteur pdfTeX"),
[XeTeX](http://www.tug.org/xetex/
"Site du moteur XeTeX")
et
[LuaTeX](http://www.luatex.org/
"Site du moteur LuaTeX")
--- en association éventuelle avec d’autres logiciels libres tels que le
pilote PostScript
[Dvips](http://tug.org/texinfohtml/dvips.html
"Manuel et documentation du pilote PostScript Dvips")
et l’interpréteur
[GPL Ghostscript](https://www.ghostscript.com/
"Site de l’interpréteur GPL Ghostscript pour PS et PDF")
pour le langage PostScript et pour le format PDF --- produisent des
documents PostScript ou PDF d’excellente facture lorsqu’ils sont configurés
de manière appropriée.

## Production de la version finale au format PostScript

Quand on produit le document final au format PostScript, l’utilisation du
pilote Dvips, qui convertit le fichier DVI (*device independent*) de TeX en
un fichier PostScript, doit faire l’objet de quelques précautions.
Les lignes de commande suivantes conviennent&nbsp;:

{{< highlight bash >}}
dvips -t a4 -Ppdf -G0 -o ${fichierPrincipal}.ps \
    ${fichierPrincipal}.dvi
dvips -t a4 -Pdownload35 -G0 -o ${fichierPrincipal}.ps \
    ${fichierPrincipal}.dvi
{{< /highlight >}}

L’inclusion des trente-cinq polices de caractères PostScript standard
devrait néanmoins être le comportement normal de Dvips depuis la version
de&nbsp;2012 de la distribution
[TeX Live](http://www.tug.org/texlive/
"Site de la distribution TeX Live du système TeX").

## Production de la version finale au format PDF

Quand on produit le document final au format PDF, on peut partir d’un
fichier PostScript obtenu comme suggéré ci-dessus (cas du
{{< quote "moteur" >}} TeX), ou plutôt des fichiers sources eux-mêmes (cas
des {{< quote "moteurs" >}} pdfTeX, XeTeX et LuaTeX plus récents).

### À partir d’un fichier PostScript

La chaîne de production TeX&nbsp;&rarr; DVI&nbsp;&rarr;
PostScript&nbsp;&rarr; PDF permet le contrôle du processus de fabrication à
chaque étape.
L’interpréteur GPL Ghostscript est équipé de l’utilitaire Ps2pdf qui propose
presque toutes les options de distillation offertes par Acrobat Distiller,
pour la conversion du fichier PostScript au format PDF.
La ligne de commande suivante convient&nbsp;:

{{< highlight bash >}}
ps2pdf -dPDFSETTINGS=/prepress \
    -dCompatibilityLevel=1.5 \
    -r2400 \
    -sPAPERSIZE=a4 \
    -dCompressPages=false \
    -dUseFlateCompression=false \
    -dProcessColorModel=/DeviceCMYK \
    -dConvertCMYKImagesToRGB=false \
    -dDownsampleColorImages=false \
    -dAutoFilterColorImages=false \
    -dColorImageFilter=/FlateEncode \
    -dColorImageResolution=350 \
    -dDownsampleGrayImages=false \
    -dAutoFilterGrayImages=false \
    -dGrayImageFilter=/FlateEncode \
    -dGrayImageResolution=350 \
    -dDownsampleMonoImages=false \
    -dMonoImageFilter=/FlateEncode \
    -dMonoImageResolution=1200 \
    -dEmbedAllFonts=true \
    -dSubsetFonts=true \
    -dMaxSubsetPct=100 \
    ${fichierPrincipal}.ps ${fichierPrincipal}.pdf
{{< /highlight >}}

### À partir des fichiers sources

Les {{< quote "moteurs" >}} modernes peuvent produire un fichier PDF à
partir des fichiers sources eux-mêmes.
Le fichier `updmap.cfg` spécifie la configuration des polices de caractères
pour la distribution TeX Live&#8239;; il indique si et comment celles-ci
doivent être incorporées dans le fichier PDF.
Afin d’inclure les polices de base standard, la ligne de commande suivante,
en mode d’administration, convient&nbsp;:

{{< highlight bash >}}
updmap-sys --setoption pdftexDownloadBase14 true
{{< /highlight >}}

L’inclusion des quatorze polices de caractères PDF standard devrait être le
comportement normal du {{< quote "moteur" >}} depuis les versions récentes
de la distribution TeX Live.

## Fichier PDF conforme au standard PDF/A ou PDF/X

Pour assurer la conservation à long terme des documents électroniques au
niveau de leur contenu en texte et graphique --- incorporation des polices
de caractères nécessaires à la reproduction fidèle dans le futur, absence de
chiffrement, non-compression des contenus graphiques, spécification de
l’espace de couleurs indépendante du matériel, insertion des métadonnées
standard ---, la spécialisation PDF/A du format PDF requiert en particulier
des documents autonomes, qui ne dépendent d’aucune information tirée de
sources externes.

Le standard PDF/X a été conçu, à l’intention de la chaîne de production
graphique et en particulier de l’impression, afin de s’assurer en amont que
les documents électroniques au format PDF peuvent être transmis et échangés
de manière transparente et fiable.

Le fichier PDF final des projets éditoriaux qui me sont confiés est conforme
à la partie {{< quote "2" >}} et au niveau de conformité {{< quote "u" >}}
du standard PDF/A (c’est-à-dire à la norme PDF/A-2u) pour l’archivage et la
préservation à long terme, comme indiqué par le logiciel et la librairie de
validation *open source* du consortium
[VeraPDF](https://verapdf.org/
"Site du logiciel et de la librairie de validation PDF/A VeraPDF").
