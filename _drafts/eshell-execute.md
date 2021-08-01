---
title: "A simple REPL for PSPP/SPSS files in emacs"
layout: single
classes: wide
categories: Linux, data
tags: emacs
---
## Emacs and statistics

A read–eval–print loop (REPL) is a simple interactive computer programming environment that takes single user inputs, executes them, and returns the result to the user. Integrated development environments (IDEs) provide this and more convenience functions such as syntax highlighting and completion, linting, and contextual help.
For example, Emacs ESS (Emacs Speaks Statistics) is one of the oldest, and most developed IDE for coding in R. For those who want to analyze SPSS data and do not have access to SPSS, there are options within R to read and evaluate SPSS databases with the help of R packages like `foreign`, `readr`, `survey`.
Provided you are not familiar with R, then you probably want to stick to  SPSS, where GNU PSPP come into the picture. PSPP is an excellent free and open source alternative to proprietary SPSS. Of course PSPP is not a full-fledged replacement of SPSS, as it was developed by a few open-source heroes rather than by large corporations. However the basic functionalities are available in PSPP and there are some features that outweigh SPSS: lightweight, fast, extensible, and last but not least has zero monetary cost.


pspp-mode is available in Emacs since 2005. It was developed by XY, and maintained by John Darrington, one of the main developer of PSPP.

Put the following line to your `packages.el`

```
(package! pspp-mode)
```

Eshell Control From Other Buffer:

Add it to `config.el` and execute arbitrary code in eshell.

```elisp
(defun my-eshell-execute-current-line ()
  "Insert text and execute of current line in eshell than move to the end of the next line."
  (interactive)
  (require 'eshell)
  (let ((command (buffer-substring
                  (save-excursion
                    (beginning-of-line)
                    (point))
                  (save-excursion
                    (end-of-line)
                    (point)))))
    (let ((buf (current-buffer)))
      (unless (get-buffer eshell-buffer-name)
        (eshell))
      (display-buffer eshell-buffer-name t)
      (switch-to-buffer-other-window eshell-buffer-name)
      (goto-char (point-max)) ;; instead of using (end-buffer)
      (eshell-kill-input)
      (insert command)
      (eshell-send-input use-region)
      (goto-char (point-max))
      (switch-to-buffer-other-window buf)
      (forward-line) ;; move to next line
      (end-of-line))))
;; (global-set-key [f8] 'my-eshell-execute-current-line) ;; this was the original binding
(map! :map pspp-mode-map
      :desc "<C-return>" :nie "<C-return>" 'my-eshell-execute-current-line)
```

[spss.el](https://www.emacswiki.org/emacs/spss.el): Major-mode for editing SPSS program files Last-Updated: 2013-05-13 By: Joe Bloggs


Other popular R IDEs are RStudio, Visual Studio Code and Sublime Text (R-box?), Neovim (NVIM-R). 
