A következőkben az idősoros elemzésekben gyakran használt
területdiagramok (areachart) típusaival fogunk foglalkozni. (A szövegben
megjelenő angol kifejezések részint a `{ggplot2}` R csomag (library)
terminológiájára, részint pedig az R statisztikáéra utalnak.) Az x
tengelyen az idő dimenziót ábrázolják, az y tengelyen pedig egy
numerikus értékeket (values) jelenítenek meg, egy vagy több kategóriális
változó (group) vonatkozásában. Az egyszerű területdiagram
tulajdonképpen a pont- és a vonaldiagram kiterjesztett változata,
amennyiben színekkel tölti ki (fill) az x tengely és a vonal közötti
területet.

Több kategóriális változó esetén előfordulhat, hogy a területek átfedik
egymást, és ez által rejtve maradnak az ábrázolt adatok egyes részei.
Ezt a területek átláthatóságának, transzparenciájának (alpha)
növelésével, vagy a területek egymásra halmozásával (vö. “stacked
charts”) kezelhetjük. Létezik egy harmadik technika is, amikor egy
mátrixot alakítunk ki különálló ábrákból (faceting). A halmozott
területdiagramnak - miként az oszlop és sávdiagramoknak is - létezik egy
speciális változata, a százalékosan halmozott területdiagram.

A következő ábrák - melyek az Eurostat adatai alapján készültek - a fent
leírt típusokat szemléltetik[1]. Végezetül pedig kitérünk a
*folyamgráfra*, ami tulajdonképpen a területdiagramok egy újabb,
speciális típusa.

## Egyszerű területdiagram (Simple areachart)

[![Egyszerű
területdiagram](/assets/img/24-09-30-folyamgraf/simple-area400.png)](/assets/img/24-09-30-folyamgraf/simple-area800.png)

### Interaktív területdiagram

cf `{dygraphs}` csomag, amely html output-ot

## Halmozott területdiagram (Stacked areachart)

[![Halmozott
területdiagram](/assets/img/24-09-30-folyamgraf/stacked-area400.png)](/assets/img/24-09-30-folyamgraf/stacked-area800.png)

## Arányosan (100 százalékig) halmozott területdiagram

[![Arányosan halmozott
területdiagram](/assets/img/24-09-30-folyamgraf/proportional-area400.png)](/assets/img/24-09-30-folyamgraf/simple-area800.png)

## Folyamgráf (streamgraph)

A [folyamgráf](http://en.wikipedia.org/wiki/Streamgraph) egy olyan
halmozott területgráf, amely egy matematikai algoritmus szerint a
központi, vízszintes tengely körül el van tolva, így folyamszerű,
hullámzó alakot eredményez. Elsőként ilyen adatvizualizációt a *New York
Times* közölt 2008-ban Lee Byron és munkatársai munkája alapján. (A
[közölt ábrájuk a mozifilmek bevételeit
jelenítette](https://archive.nytimes.com/www.nytimes.com/interactive/2008/02/23/movies/20080223_REVENUE_GRAPHIC.html)
meg.) (A módszertani részleteket lásd Byron és Wattenberg (2008)[2].) A
folyamgráf egyrészt azért érdekes, mert szokatlan, ugyanakkor intuitív,
mert az adatok trendjéről, volumenéről tömören informál. Úgymond egy
“nagy képet” közöl. De amit nyerünk a réven, elveszthetjük a vámon: nem
lehet az eredetileg megfigyelt skálán számszerűsítve értelmezni az
adatokat. Tehát a vertikális skála pozitív és negatív értékeit ne
próbáljuk a szokásos módon értelmezni. Fókuszáljunk a hullámok hosszára
(időtartamára), a színekre (kategóriákra) és a hullámok legmagasabb
pontjára, az áradás tetőzésére és elapadására. A folyamgráf akkor lehet
igazán hasznos, ha sok kategóriát (pld. mozifilmet) vizsgálunk, hosszú
időszakon keresztül.

# Interaktív folyamgráf

Online publikációhoz érdemes valamilyen interaktív megoldást találni.
Ilyen például a
[Highchart.js](https://www.highcharts.com/demo/highcharts/streamgraph),
avagy a [Flourish]().

<script src="https://public.flourish.studio/resources/embed.js"></script>
<noscript>
<img src="https://public.flourish.studio/visualisation/19575327/thumbnail" width="100%" alt="chart visualization" />
</noscript>

## Alternatívák

z-score számítás és minmax normalzálás. Bővebben lásd: Kehl Dániel.
2023. [Valószínűségszámítás és
statisztika.](https://valstat.ktk.pte.hu/zscore.html) Pécsi
Tudományegyetem Közgazdaságtudományi Kar.

[1] Az Eurostat
[migr\_asyappctza](https://ec.europa.eu/eurostat/databrowser/view/migr_asyappctza/default/table?lang=en)
jelű adatbázisát használjuk, amely a menedékkérők számának alakulásáról
tartalmaz idősoros adatokat. Az adatbázist előzőleg öt országra
szűkítettük le: Németországra (DE), Görögországra (EL), Spanyolországra
(ES), Magyarországra (HU) és Olaszországra (IT).

[2] Byron, Lee; Wattenberg, Martin (November–December 2008). “Stacked
Graphs – Geometry & Aesthetics”. IEEE Transactions on Visualization and
Computer Graphics. 14 (6). IEEE Computer Society: 1245–1252.
doi:10.1109/TVCG.2008.166. ISSN 1077-2626. PMID 18988970. S2CID
15281429.
