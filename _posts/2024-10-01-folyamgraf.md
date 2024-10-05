---
title: Területdiagramok típusai és a folyamgráf
lang: hu
output: 
  md_document:
    preserve_yaml: true
categories: [Rstats, adatvizualizáció] 
tags: [ggplot, ggstream, területdiagram, folyamgráf, streamgraph]
excerpt: "A következőkben az idősoros elemzésekben gyakran használt területdiagramok (areachart) típusaival fogunk foglalkozni. Ezek az x tengelyen az idő dimenziót ábrázolják, az y tengelyen pedig egy numerikus értékeket (values) jelenítenek meg, egy vagy több kategóriális változó (group) vonatkozásában. Az egyszerű területdiagram tulajdonképpen a pont- és a vonaldiagram kiterjesztett változata, amennyiben színekkel tölti ki (fill) az x tengely és a vonal közötti területet."
---

A következőkben az idősoros elemzésekben gyakran használt területdiagramok (areachart) típusaival fogunk foglalkozni. (A szövegben megjelenő angol kifejezések részint a `{ggplot2}` R csomag (library) terminológiájára, részint pedig az R statisztikáéra utalnak.) Eze az x tengelyen az idő dimenziót ábrázolják, az y tengelyen pedig egy numerikus értékeket (values) jelenítenek meg, egy vagy több kategóriális változó (group) vonatkozásában. Az egyszerű területdiagram tulajdonképpen a pont- és a vonaldiagram kiterjesztett változata, amennyiben színekkel tölti ki (fill) az x tengely és a vonal közötti területet. 

Több kategóriális változó esetén előfordulhat, hogy a területek átfedik egymást, és ez által rejtve maradnak az ábrázolt adatok egyes részei. Ezt a területek átláthatóságának, transzparenciájának (alpha) növelésével, vagy a területek egymásra halmozásával (vö. "stacked charts") kezelhetjük. Létezik egy harmadik technika is, amikor egy mátrixot alakítunk ki különálló ábrákból (faceting). A halmozott területdiagramnak - miként az oszlop és sávdiagramoknak is - létezik egy speciális változata, a százalékosan halmozott területdiagram.

A következő ábrák - melyek az Eurostat adatai alapján készültek - a fent leírt típusokat szemléltetik[^2]. Végezetül pedig kitérünk a _folyamgráfra_, ami tulajdonképpen a területdiagramok egy viszonylag újabb, speciális típusa.

## Egyszerű területdiagram (Simple areachart)

[![Egyszerű területdiagram]({{ site.baseurl | relative_url }}/assets/img/24-10-01-folyamgraf/simple-area400.png)]({{ site.baseurl }}/assets/img/24-10-01-folyamgraf/simple-area800.png)


## Halmozott területdiagram (Stacked areachart)

[![Halmozott területdiagram]({{ site.baseurl }}/assets/img/24-10-01-folyamgraf/stacked-area400.png)]({{ site.baseurl }}/assets/img/24-10-01-folyamgraf/stacked-area800.png)

## Arányosan (100 százalékig) halmozott területdiagram

[![Arányosan halmozott területdiagram]({{ site.baseurl }}/assets/img/24-10-01-folyamgraf/proportional-area400.png)]({{ site.baseurl }}/assets/img/24-10-01-folyamgraf/proportional-area800.png)


## Folyamgráf (streamgraph)

A [folyamgráf](http://en.wikipedia.org/wiki/Streamgraph) egy olyan halmozott területgráf, amely egy matematikai algoritmus szerint a központi, vízszintes tengely körül el van tolva, így folyamszerű, hullámzó alakot eredményez. 

Elsőként ilyen adatvizualizációt a *New York Times* közölt 2008-ban Lee Byron és munkatársai munkája alapján. (A [közölt ábrájuk a mozifilmek bevételeit jelenítette](https://archive.nytimes.com/www.nytimes.com/interactive/2008/02/23/movies/20080223_REVENUE_GRAPHIC.html) meg.) (A módszertani részleteket lásd Byron és Wattenberg (2008)[^1].)

A folyamgráf egyrészt azért érdekes, mert szokatlan, ugyanakkor intuitív, mert az adatok trendjéről, volumenéről tömören informál. Úgymond egy "nagy képet" közöl. De amit nyerünk a réven, elveszthetjük a vámon: nem lehet az eredetileg megfigyelt skálán számszerűsítve értelmezni az adatokat, legalábbis a nullánál kisebb értékeket. Tehát a vertikális skála negatív értékeit ne próbáljuk a szokásos módon interpretálni. Fókuszáljunk a hullámok hosszára (időtartamára), a színekre (kategóriákra) és a hullámok legmagasabb pontjaira, az áradások tetőzésére és elapadására. 

A folyamgráf akkor lehet igazán hasznos, ha sok kategóriát (pld. mozifilmet) vizsgálunk, hosszú időszakon keresztül.

[![Folyamgráf]({{ site.baseurl }}/assets/img/24-10-01-folyamgraf/streamgraph400.png)]({{ site.baseurl }}/assets/img/24-10-01-folyamgraf/streamgraph800.png)


# Interaktív folyamgráf

Online publikációkhoz használhatunk interaktív megoldásokat. Ilyen például a [Highchart.js](https://www.highcharts.com/demo/highcharts/streamgraph), avagy a [Flourish](https://flourish.studio/). Ez utóbbira példa az alábbi diagram.

<div class="flourish-embed flourish-chart" data-src="visualisation/19575327"><script src="https://public.flourish.studio/resources/embed.js"></script><noscript><img src="https://public.flourish.studio/visualisation/19575327/thumbnail" width="100%" alt="chart visualization" /></noscript></div>

(A posztban látható ábrák készítéséhez használt R program letölthető [innen]({{ site.baseurl }}/assets/source/2024-10-01-folyamgraf.R), a poszt forrása (R-markdown) tömorített (zip) formátumban pedig [innen]({{ site.baseurl }}/assets/source/2024-10-01-folyamgraf.zip).)

[^1]:Byron, Lee; Wattenberg, Martin (November–December 2008). "Stacked Graphs – Geometry & Aesthetics". IEEE Transactions on Visualization and Computer Graphics. 14 (6). IEEE Computer Society: 1245–1252. doi:10.1109/TVCG.2008.166. ISSN 1077-2626. PMID 18988970. S2CID 15281429.

[^2]: Az Eurostat [migr_asyappctza](https://ec.europa.eu/eurostat/databrowser/view/migr\_asyappctza/default/table?lang=en) jelű adatbázisát használjuk, amely a menedékkérők számának alakulásáról tartalmaz idősoros adatokat. Az adatbázist előzőleg öt országra szűkítettük le: Németországra (DE), Görögországra (EL), Spanyolországra (ES), Magyarországra (HU) és Olaszországra (IT). 
