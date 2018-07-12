# The escape key is dead, long live the escape key

My leader key in vim is `\`. Ever since I've made this change, I've mapped `leader-\` to save the current buffer to file. This means, in normal mode I can swiftly save by hitting `\\`.

I have been reliant on the esc key to get out of insert mode ever since I started using vim. Apparently, it is no longer considered wise to use this key, as the design no longer fits today's keyboards.

> The Vi editor was originally written on an ADM-3A terminal, which had the Escape key positioned where the Tab key occurs on most modern keyboards.[^1]

So I want to drop this habit. I am now re-training myself to avoid the escape key. Now I can just use the default alternative which is C-[ but that's no fun. So I decided that it'll be like this.

```
INSERT MODE `\\` - Exit to NORMAL MODE
NORMAL MODE `\\` - Save buffer file
```

The corresponding `.vimrc`/`init.vim` setting are like so.

```text
" Change global timeout
set timeoutlen=350

" Set the local leader.
let maplocalleader = "|"

" My C-[
inoremap \\ <esc>

" Quick save
nnoremap <silent> <leader><leader> :w<CR>
```

The other popular alternative is to use `jk`, because it doesn't appear in that many words, and you're unlikely to use that combination in vim. My issue with that is that it puts a timeout on the letter j, which I don't feel like having.

The hope is that I get used to using `\\` and it actually doesn't interrupt my usual work momentum. So far it's feeling great to write with.

---

Some true facts:

- My tmux leader is set to `
- This post is written in Markdown, code phrases and blocks are wrapped with `
- Which means this post was a PITA to write

[^1]: [Avoid the escape key →](http://vim.wikia.com/wiki/Avoid_the_escape_key)

tags: vim
