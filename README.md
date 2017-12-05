# latex-shape-completion package

This package is Atom-ic clone of the marvelous YaTeX-mode in Emacs.
Currently, the following is supported:

## Image and Greek completion.
You can invoke intuitive image completion for math and greek letters, by <kbd>:</kbd> and <kbd>;</kbd>.

![Greek Completion](https://raw.github.com/konn/atom-latex-shape-completion/resources/gifs/greek-image-completion.gif)

We also provide math font completion for `\mathfrak{..}` and so on by <kbd>@</kbd>.

## Environment completion
You can invoke environment completion by <kbd>C-c C-b</kbd>:
![Environment Completion](https://raw.github.com/konn/atom-latex-shape-completion/resources/gifs/environment-completion.gif)

## Section completion
You can invoke section completion by <kbd>C-c C-b</kbd>:
![Section Completion](https://raw.github.com/konn/atom-latex-shape-completion/resources/gifs/section-completion.gif)

## Smart Newline
With <kbd>Cmd-Return</kbd> (in macOS) or <kbd>Ctrl-Enter</kbd> (others), Atom automatically
inserts `\\`, ``\item`` or simple newline according to its context:
![Smart Newline](https://raw.github.com/konn/atom-latex-shape-completion/resources/gifs/smart-newline.gif)

## Other features
* `{\large ...}`-style and `\maketitle`-style completion is also supported.

# TODOs
* Avoid *shadowing* of names: one wants to input `\dot{...}`, but it matches `\documentclass{...}`!
* Something like `YaTeX-change-*` to change commands/parens/environments.
* Something like `YaTeX-kill-*` to smartly remove commands/parens/environments.
* Accent completion by <kbd>C-c C-a</kbd>
* Something like `YaTeX-goto-corresponding-*` by <kbd>C-c g</kbd>.
* Argument number specification via <kbd>C-u 2</kbd> or so.
* `\end{...}`-completion by <kbd>C-c e</kbd>  
  `latextools` already provides it, but doesn't care for whether it's already closed or not.
