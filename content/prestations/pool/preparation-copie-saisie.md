---
title: "Préparation de copie et saisie"
date: 2002-04-29
lastmod: 2023-04-28
description: "Transformation de la copie pour la PAO ou photocomposition"
images: ["/img/0afig.png"]
imgAuthor: "Nile"
imgWebSite: "Pixabay"
imgURL: "https://pixabay.com/photos/paper-writing-old-antique-write-623167/"
type: "prestations"
weight: 1
draft: false
---

{{< contents >}}

## Saisie du texte

Aujourd’hui, les sources de la plupart des projets éditoriaux sont
transmises au lecteur, au correcteur ou au typographe sous la forme de
fichiers informatiques.
Néanmoins, la saisie de tels fichiers à partir d’un document dactylographié
voire manuscrit reste envisageable.
Les sources d’un projet en LaTeX sont des fichiers de texte non
propriétaires, bien souvent codés en
[UTF-8](https://fr.wikipedia.org/wiki/UTF-8
"Page Wikipédia consacrée au codage UTF-8 des caractères informatiques"),
dont la saisie et la modification peuvent être réalisées avec n’importe quel
programme d’édition --- et non de traitement --- de textes disposant, pour
plus de confort et de productivité, d’un {{< quote "mode LaTeX" >}}, par
exemple l’éditeur de texte
[GNU Emacs](http://www.gnu.org/software/emacs/
"Site de l’éditeur de texte libre, personnalisable et extensible GNU Emacs")
avec l’environnement intégré
[AUCTeX](http://www.gnu.org/software/auctex/
"Site de l’environnement intégré AUCTeX d’édition TeX sous GNU Emacs").

Le format non propriétaire des sources du projet et la compatibilité au fil
du temps des révisions du système assurent la permanence du document composé
et donc le respect des investissements consentis.

## Préparation de copie

La première phase de la préparation de copie est la révision du texte afin
qu’il soit cohérent du point de vue de la structure&nbsp;: faux titre,
titre, dédicace, avant-propos, introduction, préface, notice ou glossaire,
texte principal (divisé en parties, chapitres, niveaux d’intertitres et
paragraphes), postface, notes, bibliographie, index, liste des figures et
illustrations, table des matières, colophon, achevé d’imprimer, mention du
dépôt légal et de l’imprimeur.
Un aspect important du travail de révision est l’unification de la
présentation.
En LaTeX, cela revient, pour l’essentiel, à garantir la pertinence et la
cohérence lors de l’emploi des commandes de sectionnement.

De même, la préparation de copie requiert la révision du texte afin qu’il
soit correct du point de vue de la grammaire, de la syntaxe, de
l’orthographe et de la ponctuation.
En fonction du degré de technicité de l’ouvrage, il s’agit en outre de
vérifier l’exactitude des informations, en particulier au niveau de la
bibliographie.

Enfin, la préparation de copie comporte l’étape d’observation des règles
typographiques en vigueur --- le ou les codes --- et de la marche
typographique définie par la maison d’édition pour l’ouvrage en question ou
pour la série ou collection dans laquelle il s’inscrit.
Ici encore, une présentation unifiée est un des objectifs du travail.
La préparation sur les fichiers sacrifie l’avantage de la coexistence, sur
le papier, de la version d’origine et de celle où sont portés les signes de
correction&#8239;; en LaTeX, on travaille cependant sur une copie des
fichiers d’origine, et des programmes existent qui permettent d’afficher les
différences entre les fichiers de source, et même entre les versions
composées par le {{< quote "moteur" >}} de mise en pages (système de suivi
des corrections).

Outre les exigences spécifiques de l’auteur ou de la maison d’édition, tous
les projets éditoriaux qui me sont confiés sont d’emblée placés sous le
contrôle du logiciel de gestion de versions
[Git](https://git-scm.com/
"Site du système de contrôle de versions Git").
