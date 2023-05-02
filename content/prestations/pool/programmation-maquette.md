---
title: "Programmation de maquette"
date: 2002-04-29
lastmod: 2023-04-28
description: "Traduction de la charte graphique en code informatique LaTeX"
images: ["/img/0cfig.png"]
imgAuthor: "Natalia&nbsp;Y."
imgWebSite: "Unsplash/@foxfox"
imgURL: "https://unsplash.com/fr/photos/Oxl_KBNqxGA"
type: "prestations"
weight: 3
draft: false
---

{{< contents >}}

En LaTeX, une classe de documents est la transcription d’une partie
importante des règles et consignes de composition en vigueur dans une maison
d’édition (c’est-à-dire la marche typographique), en particulier celles qui
relèvent de la charte graphique.
Les classes de documents peuvent être programmées *ex nihilo* ou, le plus
souvent, sur la base d’une classe standard telle que
[book.cls](https://ctan.org/pkg/book
"Page CTAN consacrée à la classe standard de documents book.cls")
ou d’une classe étendue telle que
[scrbook.cls](https://ctan.org/pkg/koma-script
"Page CTAN consacrée à la classe étendue de documents scrbook.cls")
ou
[memoir.cls](https://ctan.org/pkg/memoir
"Page CTAN consacrée à la classe étendue de documents memoir.cls").

Si la programmation d’une telle classe de documents n’est pas obligatoire
pour tout projet éditorial, elle constitue néanmoins un investissement
justifié dans le cadre d’une série ou d’une collection d’ouvrages dans
laquelle le projet s’inscrit.
Dans ce cas, la disponibilité d’une classe de documents spécifique permet un
gain de productivité et une économie d’échelle, et garantit une homogénéité
de présentation au travers de la série ou collection --- condition
nécessaire de l’identité graphique choisie par l’éditeur.

## Fonction et représentation

LaTeX est un système ouvert et libre&nbsp;: on peut programmer, étendre et
modifier son comportement, et les sources des documents contiennent à la
fois le texte et les commandes de marquage dans un format non propriétaire.
Les commandes de marquage correspondent aux indications qui étaient
transmises au typographe à l’époque du plomb.
Le marquage est cependant devenu logique&nbsp;: il ne s’agit pas d’indiquer
l’opération à effectuer sur un fragment de texte afin de le composer (par
exemple, le passage en gras et en italique), mais de spécifier sa place ou
sa fonction dans la structure hiérarchisée de l’ouvrage (par exemple, un
intertitre de niveau&nbsp;2, c’est-à-dire une commande `\subsection`).
Cela sépare les dispositions typographiques du contenu lui-même (équipé du
marquage de sa structure)&#8239;; les directives de mise en forme graphique
sont groupées dans la classe de documents et les extensions, tandis que le
contenu et le marquage logique ou fonctionnel se trouvent dans les sources.

## Exemple de marquage logique

Afin de composer, dans un ouvrage de géométrie, des vecteurs et tenseurs, le
mieux est de les marquer comme de tels {{< quote "objets" >}} mathématiques
dans les sources de l’ouvrage --- où il s’agit de marquage logique ou
fonctionnel ---, et d’indiquer, cette fois au sein de la classe de
documents, les directives de représentation graphique des objets en
question.
Ainsi, la classe pourra comporter les dispositions suivantes&nbsp;:

{{< highlight latex >}}
\RequirePackage{bm}
\newcommand{\vecteur}[1]{\ensuremath{\bm{\mathit{#1}}}}
\newcommand{\tenseur}[1]{\ensuremath{\bm{\mathrm{#1}}}}
{{< /highlight >}}

tandis que les sources associeront le contenu et son marquage logique, sans
aucune mention de la représentation&nbsp;:

{{< highlight latex >}}
\begin{displaymath}
    \vecteur{w}
    =\sum_\alpha w^\alpha\vecteur{e}_\alpha
    \qquad
    \tenseur{g}(\vecteur{u},\vecteur{v})
    =\vecteur{u}\cdot\vecteur{v}
\end{displaymath}
{{< /highlight >}}

{{< image
    src="/img/logmark.png"
    alt="Exemple de marquage logique ou fonctionnel"
    width="1920"
    height="105"
>}}

Une modification de la représentation *via* la classe se propage ainsi de
manière homogène à tout le document composé, sans nécessiter une
manipulation des sources.
Bien entendu, on peut définir en outre des raccourcis ou *alias* pour les
commandes les plus utilisées, par exemple&nbsp;:

{{< highlight latex >}}
\newcommand{\metrique}{\tenseur{g}}
{{< /highlight >}}

pour le tenseur métrique d’une variété riemannienne.
