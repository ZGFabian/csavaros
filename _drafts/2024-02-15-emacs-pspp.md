---
title: "Statisztikai elemzés pspp-vel Emacs-en"
subtitle: "egy lehetséges SPSS alternatíva"
summary: "Manapság sokféle környezet (python, R, stb) kínál lehetőséget statisztikai elemzésre. Az SPSS talán az egyik legkönnyebben megtanulható alkalmazás, de igen költséges egy egyéni felhasználó számára."
lang: hu
categories: [linux]
tags: [spss, pspp, emacs, company-mode]
---
Manapság sokféle környezet ([Python Pandas](https://pandas.pydata.org/), [R](https://www.r-project.org/), stb) kínál lehetőséget statisztikai elemzésre. Az [SPSS](https://www.ibm.com/spss) talán az egyik legkönnyebben megtanulható alkalmazás, de igen költséges egy egyéni felhasználó számára. (Jelenleg az alap ("Base") verzíó liszence 3800 USD-be kerül egy felhasználó számára.)

A [*PSPP*](https://www.gnu.org/software/pspp/) az *SPSS* statisztikai program nyílt forráskódú (és ingyenes) alternatívája. Egyaránt futatható interaktívan, grafikus környezetben és terminálból, akár szkriptként is. Ez utóbbihoz remek fejlesztési környezetet lehet kialakítani az [Emacs](https://www.gnu.org/software/emacs/) segítségével, ami az egyik legrégebbi szövegszerkesztő és fejlesztési környezet ([IDE]()).

A régi múlt - az egyik legelcsépeltebb szólással élve - egyszerre áldás és átok. Adottak a *terminus technicus*-ok (pld. "buffer", "kill", "yank"), zavaró billentyűzet kombinációk és funkciók. (Pld. a másolás nem `Ctrl-C`, hanem `Alt-W`, de az `Alt` billentyűt véletlenül sem alt-nak hívják, hanem metának (`M`). A Windows billentyűt pedig Super-nek. Szuper: talán ezt hívják [útfüggőségnek](https://hu.wikipedia.org/wiki/%C3%9Atf%C3%BCgg%C5%91s%C3%A9g).

[![Egy ősi billentyűzet, melyet a Wikipedián találtak a régészek]({{ site.baseurl }}/img/24-02-23-emacs-pspp/640px-Space-cadet.jpg)]({{ site.baseurl }}/img/24-02-23-emacs-pspp/1280px-Space-cadet.jpg)

Az Emacs szofisztikált környezetet kínál különböző statisztikai alkalmazásokhoz (pld. R, SAS, Stata) az [ESS ("**E**macs **S**peaks **S**tatistics")](https://ess.r-project.org/) csomag révén. A PSPP programozásához a pspp-mode nyújt támogatást, kiszínezi a kulcsszavakat és azok hárombetűs rövidítéseit, de automatikus kiegészítést nem kapunk. A [company-pspp.el](https://gist.github.com/ZGFabian/280cc97b7c51e1d120293c001bca0834) company-mode esetén ezt pótolja. 


```emacs-lisp
(use-package pspp-mode
  :init
  (load-file "/home/fabian/.emacs.d/company-pspp.el")
  )
```

[Lásd: company-pspp.el a github-on.](https://gist.github.com/ZGFabian/280cc97b7c51e1d120293c001bca0834)

Ha az Emacs shell-en pspp-t futtatunk, akkor a `CTR-ENTER` kombináció végrehajtja parancsainkat.

```emacs-lisp
(add-hook 'pspp-mode-hook
  (lambda ()
    (local-set-key (kbd "C-<return>") 'sh-send-line-or-region-and-step)
    ))
```

A fenti programrészleteket az Emacs konfigurációs fájljához (`.emacs`) célszerű adnunk, amely Linux esetében általában a home (`~`) könyvárunkban található.

[![Képernyőkép]({{ site.baseurl }}/img/24-02-23-emacs-pspp/company-pspp-640.png)]({{ site.baseurl }}/img/24-02-23-emacs-pspp/company-pspp.png)
