---
title: "Référencement et indexation"
date: 2002-04-29
lastmod: 2023-04-28
description: "Établissement de l’appareil critique d’un livre d’érudition"
images: ["/img/0efig.png"]
imgAuthor: "Erol Ahmed"
imgWebSite: "Unsplash/@erol"
imgURL: "https://unsplash.com/fr/photos/Y3KEBQlB1Zk"
type: "prestations"
weight: 5
draft: false
---

{{< contents >}}

Le référencement et l’indexation d’un document sont deux opérations
importantes de la préparation d’un ouvrage&#8239;; elles demandent de la
rigueur et de la méticulosité, et le mieux est sans doute de les confier,
sous la supervision de l’auteur, à la personne qui s’est chargée de la
préparation éditoriale voire typographique du texte.

Ces opérations permettent au lecteur de se déplacer dans le document en
fonction de ses centres d’intérêt préalables, des orientations qu’il donne à
sa lecture et de ses décisions futures&nbsp;: elles recouvrent
l’établissement de références croisées, d’un sommaire, d’une table des
matières, d’une ou plusieurs bibliographies (par chapitre, par thème, par
nature des références,&nbsp;etc.), d’un glossaire et enfin d’un ou plusieurs
index (par exemple un index thématique et un index onomastique).
Il s’agit de l’appareil critique.
Il est important de réaliser le glossaire et les index en adoptant le point
de vue des lecteurs et en effectuant une sélection.
Les bibliographies peuvent en outre être {{< quote "inversées" >}},
c’est-à-dire que chaque entrée bibliographique peut mentionner la liste des
pages qui font appel à elle dans le corps du document.

L’établissement des références croisées, du sommaire et de la table des
matières est une opération automatique ou semi-automatique en LaTeX, grâce à
des commandes ou des extensions *ad hoc*, mais la création de la
bibliographie, du glossaire et de l’index demande une planification et de la
minutie.

## La bibliographie

L’outil proposé ici est
[BibTeX](https://ctan.org/pkg/bibtex
"Page CTAN consacrée à l’ancien système BibTeX")
ou
[BibLaTeX](https://ctan.org/pkg/biblatex
"Page CTAN consacrée au nouveau système BibLaTeX")
--- dans ce dernier cas, de préférence avec le programme
[Biber](https://ctan.org/pkg/biber
"Page CTAN consacrée au programme Biber").

### BibTeX

Le programme BibTeX, qui suppose l’adoption d’un style de bibliographie
préexistant ou la programmation d’un style approprié (par exemple grâce à
l’extension
[Makebst/Custom-bib](https://ctan.org/pkg/custom-bib
"Page CTAN consacrée à l’extension Makebst/Custom-bib")),
peut encore, malgré quelques limites, rendre de grands services pour
l’établissement de la bibliographie.

Le programme BibTeX est alors utilisé pour le classement des entrées et la
production des labels, mais aussi pour le formatage des informations de
bibliographie.
La programmation d’un nouveau style de bibliographie suppose la maîtrise du
langage de BibTeX.
La ligne de commande conseillée pour BibTeX est la suivante (implantation en
huit bits et capacité maximale)&nbsp;:

{{< highlight bash >}}
bibtex8 -W ${fichierPrincipal}.aux
{{< /highlight >}}

### BibLaTeX

Avec le système BibLaTeX, plus récent, le formatage des informations de
bibliographie n’est pas implanté dans les fichiers de style, mais il est
contrôlé par des commandes écrites en TeX.
Ce nouveau paradigme est beaucoup plus souple et expressif que l’ancien.

La programmation d’un nouveau style de bibliographie et d’un style de
citation approprié ne suppose que la maîtrise de LaTeX.
En outre, le couple constitué de BibLaTeX et de Biber lève toutes les
limites et contraintes inhérentes à BibTeX et à ses fichiers de style de
bibliographie, avec en particulier une prise en charge complète
d’[Unicode](https://fr.wikipedia.org/wiki/Unicode
"Page Wikipédia consacrée au standard d’échange de textes Unicode").
La ligne de commande pour Biber est la suivante&nbsp;:

{{< highlight bash >}}
biber ${fichierPrincipal}.bcf
{{< /highlight >}}

## Le glossaire et l’index

L’outil proposé ici est
[Makeindex](https://ctan.org/pkg/makeindex
"Page CTAN consacrée à l’ancien programme Makeindex")
ou
[Xindy](https://ctan.org/pkg/xindy
"Page CTAN consacrée au nouveau programme Xindy")&#8239;[^Xindy].

### Makeindex

Afin de trier les entrées d’index renseignées dans les sources du document,
l’outil le plus ancien est Makeindex.
Ce programme n’est cependant pas très adapté au classement alphabétique de
termes qui comportent des signes diacritiques.
Une solution laborieuse --- et en partie insatisfaisante --- consiste à
{{< quote "doubler" >}} le contenu des entrées&nbsp;: une première forme
destinée au classement, une seconde correspondant à ce qui doit être
imprimé.
Quelques exemples&nbsp;:

{{< highlight latex >}}
\index{equation@équation}
\index{methode alpha@méthode~$\alpha$}
\index{derivee@dérivée!premiere@première}
\index{solution!generale@générale}
\index{densite@densité!tensorielle}
{{< /highlight >}}

La ligne de commande pour Makeindex est la suivante, dans le cas d’un index
(par opposition à un glossaire)&nbsp;:

{{< highlight bash >}}
makeindex -c -l -s ${fichierStyleIndex}.ist \
    -t ${fichierPrincipal}.ilg \
    -o ${fichierPrincipal}.ind \
    ${fichierPrincipal}.idx
{{< /highlight >}}

Dans le cas d’un glossaire&nbsp;:

{{< highlight bash >}}
makeindex -c -l -s ${fichierStyleGlossaire}.ist \
    -t ${fichierPrincipal}.glg \
    -o ${fichierPrincipal}.gls \
    ${fichierPrincipal}.glo
{{< /highlight >}}

### Xindy

Xindy constitue un système plus moderne que Makeindex pour le tri et le
traitement des glossaires et index.
Quelques précautions doivent cependant être prises selon le
{{< quote "moteur" >}} utilisé, la nature des alphabets employés et le
codage interne de l’index {{< quote "brut" >}} à traiter par Xindy.
Le problème vient de la manière dont les caractères
{{< quote "non ASCII" >}}, dans les sources du document, sont transcrits par
le {{< quote "moteur" >}} TeX ou pdfTeX dans l’index {{< quote "brut" >}}
lorsque l’extension `inputenc.sty` est utilisée avec l’option `utf8`.

Les anciens {{< quote "moteurs" >}} TeX et pdfTeX produisent un index
{{< quote "brut" >}} codé en représentation interne de caractères LaTeX (en
anglais, *LaTeX Internal Character Representation*, LICR)&#8239;; les
caractères {{< quote "non ASCII" >}} sont donc codés sous la forme de
séquences de contrôle.
Il faut alors utiliser Texindy ({{< quote "Xindy pour TeX" >}}).
La ligne de commande suivante convient pour un index en français&nbsp;:

{{< highlight bash >}}
texindy --language french \
    --codepage utf8 \
    --module ${fichierStyleIndex}.xdy \
    ${fichierPrincipal}.idx
{{< /highlight >}}

En revanche, dans le cas des {{< quote "moteurs" >}} modernes XeTeX et
LuaTeX (avec ou sans le format LaTeX), l’index {{< quote "brut" >}} est codé
en UTF-8.
Il faut alors utiliser Xindy lui-même.
La ligne de commande suivante convient pour un index en français&nbsp;:

{{< highlight bash >}}
xindy --language french \
    --codepage utf8 \
    --module ${fichierStyleIndex}.xdy \
    ${fichierPrincipal}.idx
{{< /highlight >}}

Si l’on emploie des alphabets non latins (par exemple le grec ou le
cyrillique), il est de toute manière préférable de choisir le
{{< quote "moteur" >}} XeTeX ou LuaTeX, ce qui conduit au second cas
ci-dessus, avec des sources codées en UTF-8.

[^Xindy]: Pour le programme Xindy, on peut en outre consulter
[ce lien](http://www.xindy.org/
"Site consacré au système d’indexation flexible Xindy").
