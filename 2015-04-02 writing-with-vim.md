
# Writing with Vim

### There is an abundance of reliable writing software for OSX, personally I like iA Writer both in my mobile devices and in my laptop, WriteRoom is a close contender for its customizability. As a programmer, for the better part of the day I am on a terminal coding in Vim. 

I cannot count the times where I’ve written `:w` in iA writer in an attempt to save a document (primitive, one should map it to a function key). Writing files in a Vim-specific workflow can become a force of habit because of the command structure's design, thus I integrated Vim into my blogging workflow to fully utilize coding habits that I can carry over. 

<!--more-->

For the sake of brevity, I will skip over the smaller details in setting up Vim for writing. Instructions are all over the Internet, Google is your friend. 

My needs are simple: 
- Lines need to soft-wrap automatically
- Markdown syntax should be highlighted
- A distraction free interface
- A decent color theme, typeface, and line-height

## Why Vim?

I think it makes sense to write this because Vim is free, and there are a lot of young writers out there that can't afford spending money on writing software that may not fit into their workflow. This is my attempt at ["emphasizing"](https://www.google.com.ph/search?q=writing+with+vim) this one free option, that it is a good contender to premium software. Yes, it does take some work and effort, but most free software are not as reliable as Vim, it could be well worth it in the end.

## iTerm2

The native terminal app on OSX is decent, but it doesn't support colors and fonts well enough. So iTerm2 is a hard requirement here. 

The following iTerm configuration are personal preferences, but I find that you need to set up the equivalent of these to get the most of iTerm.

### Installing the Solarized theme

Download it from [Ethan Schoonover's site](http://ethanschoonover.com/solarized), and plop the appropriate color settings in iTerm's preference page.

We will talk about a Solarized color scheme plugin for Vim later on in this article, it works amazingly for what we need, but I like that the shell matches Vim. This step is completely optional. 

### Allowing italic fonts

In iTerm's preference window, there's a tickbox for italic text under the Text panel. This is a bit misleading because it doesn't work out of the box, you'll have to manually add the escape sequences for italic so that iTerm understands that it should use the italic fonts between those markers in the screen.

Using [this Gist](https://gist.github.com/sos4nt/3187620) create a file somewhere. Then on your terminal enter `tic filename`. Then on iTerms preferences window, change the Terminal Type to `xterm-256color-italic`. At this point you'll want to restart iTerm or spawn a new window to work on to see the changes register. 

### Picking a better typeface

I usually use the Powerline patched Menlo typeface to write code, known as Meslo. It doesn't have italics and the __bold__ isn't even a _real bold font_. The visual aids of the Powerline fonts outweigh having real italics and bold typefaces, and so I just go with Meslo for my day job. But when blogging, I don't need the Powerline symbols, and so I have the luxury to use a font family. 

[Cousine](http://www.google.com/fonts/specimen/Cousine) is a free font family on Google Fonts, and I sync it down to my Macbook using [Skyfonts](http://www.fonts.com/web-fonts/google). This typeface has both __bold__ and _italic_ support, and is monospaced. It also closely resembles the font on iA Writer so that's a plus. 

Once downloaded configure it on iTerms preference window, and pick a size you're comfortable with, when writing I prefer nothing lower than 16pts.

While you're at it, make sure you set the line-height to a minimum of 1.4 to improve readability.

### Updating Vim

In the next section, we're going into Vim plugins, most of these plugins require Vim 7.4 or higher. It's a tricky afair updating Vim on OSX. My preferred method is through [homebrew](http://brew.sh/). Then just `brew install vim`. Make sure to refresh your shell and run `vim --version` to verify.

---

## Vim Plugins

Firstly install a package manager. My poison is [Vundle](https://github.com/gmarik/Vundle.vim). This allows you to install Vim plugins straight from Github. 

### Some basic Vim configuration

You might want to be able to use your trackpad to scroll, sometimes it's just more convenient for skimming over text than jumping around.

```vim
" Enable mouse scroll
:set mouse=nicr
```

I use 2 spaces as tabs when coding, might not be the best when writing blogs, but I like consistency. I use the same soft tabs in writing as well. 

```vim
" Soft tabs
set tabstop=2 shiftwidth=2 expandtab
```

The native Vim on OSX already has the following as a default, but since we installed over homebrew, we'll have to set this manually. The reason being Apple keyboards' "Backward Delete" registers as a regular delete in terminals, and so we don't see expected behavior withing Vim. Non-OSX users don't have to worry about this.
 
```vim
" Backspace behavior
set backspace=2
```

We'll need this so our beautiful syntax highlighting and color plugins work later.

```vim
" Enable Syntax Highlighting
syntax enable
```

Remember the time when F2 saved any file, game, etc. You'd want this to avoid hitting `ESC :w ENTER` all the time.

```vim
" <F2> to save
:nnoremap <F2> :w<cr>
:inoremap <F2> <c-o>:w<cr>
```

### Distraction Free Writing with Goyo

[Goyo](https://github.com/junegunn/goyo.vim) takes cue from distraction free writing tools like WriteRoom and iA writer. It removes all of Vim's __chrome__, then centers the text and sets the text within a fixed line-width or CPL. 

```vim
Plugin 'junegunn/goyo.vim'
```

The default CPL is 80, this might be too long for some people like myself, I prefer anything between 65 and 72. To start Goyo automatically and set a custom CPL add this to your .vimrc.

```vim
au Filetype markdown Goyo 72
```

This plugin is almost perfect, but the way it hides the __chrome__ is through trickery, and like any trick-based solution, there are drawbacks, for one `:q` (exit) will not behave as expected. Instead of closing Vim, it will close a window Goyo has spawned. To restore the expected behavior add the following to your .vimrc: 

```vim
" c/o https://github.com/junegunn/goyo.vim/wiki/Customization
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd User GoyoEnter call <SID>goyo_enter()
autocmd User GoyoLeave call <SID>goyo_leave()
```

### Beautiful colors with Solarized and Pencil
I personally use:

```vim
Plugin 'altercation/vim-colors-solarized'
```

But I have seen and also liked:

```vim
Plugin 'reedes/vim-colors-pencil'
```

Firstly, you will start hearing more about [Reede Esau](https://github.com/reedes) if you decide to commit to writing in Vim and continue improving your setup. He has a vast and useful [collection](http://wynnnetherland.com/journal/reed-esau-s-growing-list-of-vim-plugins-for-writers/) of Vim plugins intended for writers. For our bare minimum approach, we will use one of his Plugins, more about that later. Secondly, I prefer the light version of Solarized when writing, a white screen will not only ruin your sleep cycles, it also easily fatigues your eyes faster. I can go for the Dark theme to avoid it but I find the lighter colors are a bit more relaxing when writing.

To enable these colors, add this to your .vimrc:

```vim
:set background=light
:colorscheme solarized
" or pencil in place of solarized
```

### Syntax Highlighting
If you intend to blog on Vim, then likely you'll use Markdown to extend your layouting capability. For this we use: 

```vim
Plugin 'plasticboy/vim-markdown'
```

I prefer this over [tpope's version](https://github.com/tpope/vim-markdown) because it supports front-matter which we use in [Lilii](https://lilii.co), and has slightly better highlighting. One reason I'd use tpope's version over plasticboy's is because it supports Vim's conceal to hide modifier markups for bold and italic text, thus fully utilizing our italic font configuration for iTerm. 

These plugins automatically identify markdown files, in my experience, by extension (.md). If you want it to treat text (.txt) files as Markdown then add this to your .vimrc:

```vim
au BufRead,BufNewFile *.txt set filetype=markdown
```

plasticboy's plugin folds Markdown content by heading, and most wouldn't like that feature by default, so if you're using his plugin, add this to disable folding: 

```vim 
let g:vim_markdown_folding_disabled=1
```

To enable front-matter support:

```vim 
let g:vim_markdown_frontmatter=1
```

This is very useful if you blog on Jekkyl.

### Soft wrap, Concealing Markup, Better undo points

By default vim will break your words into the next line when it reaches the line-width. This is not a behavior most writers would expect, but it does make sense for writing code. This can be fixed through Vim configuration but then you'd have to follow that up with updated navigation key mappings. To simplify things, we can use vim-pencil:

```vim
Plugin 'reedes/vim-pencil'
```

It won't work out of the box, possibly the basic premise is that we only want to use this plugin on a small set of file types, i.e. text and Markdown. To enable it, we add:

```vim
ugroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END
```

Now we enable soft wrap mode by default: 

```vim
let g:pencil#wrapModeDefault = 'soft'
```

And we enable conceal support. Do note that at this time, only tpope's vim-markdown plugin supports conceal markers, so to utilize this you'll have to use his plugin alongside vim-pencil: 

```vim
let g:pencil#conceallevel = 3
let g:pencil#concealcursor = 'c'
```

The undo points improvement seems to be enabled by default. When you undo you will notice that it restores to a state where a punctuation has been entered. 

### Baseline Conclusion

This wraps up the baseline plugins that I use for writing with Vim. Aside from these plugins I use a few more for editing, mostly Reed's, and a couple for file management. 

At this point, you can start writing.

## Final Round: Extras

I'm not going to elaborate on these items, as I found they are more preferential than essential. 

```vim
Plugin 'scroloose/nerdtree'
```

This is a sidepane file browser, useful for quickly swapping around files, I try to maintain only a single buffer session on Vim so I don't find this plugin as useful as when I am writing code. But it's still worth having and useful on some occasions.

```vim
Plugin 'kien/ctrlp.vim'
```

I would usually use this more than NERDTree, this is a fuzzy name file browser, you can type a partial name and will display a list of matching files you can select to open. This is useful on some occasions.

```vim
Plugin 'reedes/vim-wordy'
```

This is a plugin that highlights possible problems in your writing. I'm not well acquainted with this plugin, but at first glance it looks really useful, I wish to use it more. I can't even describe how it works yet, so here's a snippet from the Github page: 

> _wordy_ is not a grammar checker. Nor is it a guide to proper word usage. Rather, wordy is a lightweight tool to assist you in identifying those words and phrases known for their history of misuse, abuse, and overuse, at least according to usage experts.
> - [reedes/vim-wordy](https://github.com/reedes/vim-wordy)

```vim
Plugin 'reedes/vim-lexical'
```

This one is amazing, because well, vim isn't really for writing and so there is no full English dictionary support. I will explain this as briefly as I could: Dictionary completion, Thesaurus synonym completion, spell-check.

That concludes it, I think one feature I'm missing is parts-of-speech highlighting. I've once developed a POS highlighter on a web-based text editor, and I miss that feature the most, it's the one editing tool I think matches my workflow. 

I might write about my Vim adventures for coding, but when I looked at my .vimrc, I realized it's too intimidating. For now this should do. 


