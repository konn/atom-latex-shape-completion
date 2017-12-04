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

## Other features
* `{\large ...}`-style and `\maketitle`-style completion is also supported.

# TODOs
* Something like `YaTeX-change-*` to change commands/parens/environments.
* Something like `YaTeX-kill-*` to smartly remove commands/parens/environments.
* Smart newlines: we want to append `\\` or `\item` automatically by <kbd>C-j</kbd> or <kbd>M-Enter</kbd>.
