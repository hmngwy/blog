# The Updated 2017 Python Setup

Updated: Sep 9, 2017

Oh what a time to be a Python dev.

### Neovim

I use [neomake](https://github.com/neomake/neomake) to run my linters, after a friend berated me for using syntastic, which was in fact [reasonable](https://github.com/vim-syntastic/syntastic/issues/542). Linters are [pylint](https://pypi.python.org/pypi/pylint) for syntax checking, [pycodestyle](https://pypi.python.org/pypi/pycodestyle) for PEP8 conformity, and [pydocstyle](https://pypi.python.org/pypi/pydocstyle) for PEP257 conformity.

To assist me with the nearly invisible [PEP8](https://www.python.org/dev/peps/pep-0008/) requirements, I use autopep8 loaded on vim via [neoformat](https://github.com/sbdchd/neoformat).

It's probably dumb but currently I have [:Neoformat on BufWritePre](https://github.com/hmngwy/dotfiles/blob/dd3bfb4a63884362c203ae7d213a066d4cdd1db1/vim/modules/plugins/neoformat.vim#L1-L4).

### Environment

Of course, [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/). I have a fancy prompt line ([customized](https://github.com/hmngwy/dotfiles/blob/dab6b8a393052f4f5e0fd015f6038e95b8bbc1a6/zsh/zsh_aliases#L29-L76)) for my zsh which takes advantage of the project directory configuration of a venv.

<div>
<script type="text/javascript" src="https://asciinema.org/a/ZIdTVRbYXvs1uNTqlSBTqVRZa.js" id="asciicast-ZIdTVRbYXvs1uNTqlSBTqVRZa" async></script>
</div>

### Tests

New to testing in Python, because I used to just fuck around with non-distributable code. But [pytest](http://pytest.org) is fun with the [assert](https://docs.pytest.org/en/latest/assert.html) lines.

Tags: python