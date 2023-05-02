---
title: "Correction d’épreuves et report"
date: 2002-04-29
lastmod: 2023-04-28
description: "Application du code typographique et de la marche maison"
images: ["/img/0bfig.png"]
imgAuthor: "Christian Scheen"
imgWebSite: "PUF"
imgURL: "https://www.puf.com/"
type: "prestations"
weight: 2
draft: false
---

{{< contents >}}

## Composition et mise en pages

Grâce à une série de lectures d’épreuves et de reports de corrections qui
implique tous les acteurs de la chaîne éditoriale --- au niveau de la
structure, de la mise en pages, de la grammaire, de l’orthographe, de la
ponctuation, de la typographie ---, il s’agit de conduire l’ouvrage jusqu’à
l’épreuve que l’auteur juge satisfaisante sur le fond et la forme, et dont
il autorise le tirage.

C’est bien sûr lors de cette étape que l’interaction avec le
{{< quote "moteur" >}} de mise en pages est la plus étroite.
Les {{< quote "moteurs" >}} de la famille TeX
([TeX](https://www-cs-faculty.stanford.edu/~knuth/
"Page personnelle du professeur Donald E. Knuth, créateur du moteur TeX")
lui-même,
[pdfTeX](http://www.tug.org/applications/pdftex/
"Site du moteur pdfTeX"),
[XeTeX](http://www.tug.org/xetex/
"Site du moteur XeTeX")
et
[LuaTeX](http://www.luatex.org/
"Site du moteur LuaTeX"))
induisent un mode d’interaction bien différent de celui auquel les autres
systèmes nous ont habitués, lors de la correction informatique des
épreuves&nbsp;: celle-ci est retardée --- en anglais, on parle de traitement
*batch* --- de la modification ou correction des sources à leur traitement
éditorial ou typographique effectif.

L’unité de base, pendant le traitement du texte par les
{{< quote "moteurs" >}} de la famille TeX, est le paragraphe.
Pour chaque paragraphe, l’algorithme de coupure calcule et ensuite qualifie
un certain nombre de solutions du problème de la division de mots en fin de
ligne&#8239;; il peut alors sélectionner et appliquer la solution optimale,
en fonction de critères de qualité précis sur lesquels le typographe peut
intervenir.

La qualité de cet algorithme de coupure a toujours constitué un des
principaux arguments qui plaident en faveur de TeX&#8239;; les règles de
division pour chaque langue sont appliquées avec minutie, tout en procurant
un gris typographique d’une belle homogénéité.
À partir de&nbsp;2004, cette situation a encore été améliorée grâce à
l’utilisation de {{< quote "moteurs" >}} modernes et de l’extension
[Microtype](https://ctan.org/pkg/microtype
"Page CTAN de l’extension Microtype et ses raffinements typographiques")
qui effectue la microchirurgie suivante sur les caractères eux-mêmes de la
police utilisée.

{{< smallcaps "Expansion" >}}.---
:   Étirement ou contraction des caractères.

{{< smallcaps "Tracking" >}}.---
:   Addition ou soustraction uniforme d’espace entre les lettres composées
en capitales ou petites capitales.

{{< smallcaps "Kerning" >}}.---
:   Crénage entre certaines lettres individuelles.

{{< smallcaps "Spacing" >}}.---
:   Ajustement de l’espace entre les mots.

{{< smallcaps "Protrusion" >}}.---
:   Avancée des signes de ponctuation lorsque ceux-ci se trouvent en fin de
ligne.

## Automatisation de tâches

Dans un souci d’uniformité, le système LaTeX et ses extensions automatisent
certaines tâches de mise en pages, parmi lesquelles on peut
mentionner&nbsp;:
1.  la numérotation des divisions du texte en parties, chapitres et
intertitres&#8239;;
2.  la numérotation des éléments hors texte, tels que les tableaux, les
algorithmes, les illustrations et les figures (avec leurs légendes), les
équations,&nbsp;etc.&#8239;;
3.  la composition des folios (numéros d’ordre des pages)&#8239;;
4.  la composition des titres courants et des pieds de page&#8239;;
5.  la numérotation des notes en bas de page ou en fin de document&#8239;;
6.  la composition de la table des matières ou du sommaire&#8239;;
7.  la composition de la bibliographie, grâce au concours d’un système tel
que BibTeX ou, de préférence, BibLaTeX avec Biber&#8239;;
8.  la composition de l’index et du glossaire, grâce à l’appoint d’un
programme tel que Makeindex ou, de préférence, Xindy&#8239;;
9.  d’une manière générale, la production des références croisées pour tous
ces éléments de l’ouvrage, le cas échéant sous la forme d’hyperliens.
