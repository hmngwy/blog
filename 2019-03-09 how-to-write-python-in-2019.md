# Writing Python in 2019

Like a sane person.

### Use Python 3

Like [last time](/how-to-write-python-in-2018.md), I like to implore you to write in Python 3, Python 2's EOL is next year, 2020.

### Read PEP 20

`python -m this`, every now and again. Granted I forget to read this since the last time I wrote this article, but I kept some of it by heart. Let me go over my last year's take-aways.

> Explicit is still better than implicit

I think I can count a handful of ways I've tried to maneuver our way out of creating an implicit behavior in our API to provide "cool" features, this is easy deceivingly easy to forget.

> Flat is better than nested

This isn't always the case, and I've modified what this means for me, a lot of the API that I write is no longer flat, real flat becomes hard to maintain and communicate with sparse documentation. "Flat" is a relative term, find your own "flat".

> Sparse is better than dense

This I like to keep as is, as this keeps us from feature creep.

> If the implementation is hard to explain, it's a bad idea

This is still true, especially for me, I tend to envision really expensive APIs that I end up later dismissing as too complicated literally at the end of the same day I thought of it. It helps to have people call you out on it.

### Write Docstrings

I ended up writing docstrings in an arbitrary format, because we don't really generate documentation for it. Which is not a good thing. To enforce writing docstrings, you should start generating API documentation for it.

When you generate documentation from docstrings, you can get a clear picture of your API as well. This helps you find code to improve.

### Use Linters

I use a combination of Flake8, and Pylint, because I hate myself. However, I've adjusted them to fit [black](https://github.com/ambv/black)'s requirements to keep me sane.

If you're using Neovim, use [Neoformat](https://github.com/sbdchd/neoformat) to run black, and use [Ale](https://github.com/w0rp/ale) for the linters.


### Use pyenv to manage Python versions

Stop using brew, or other package managers. They're opinionated, they don't care about maintaining multiple Python versions, and it's better to have your own opinion about it.

Use [pyenv](https://github.com/pyenv/pyenv) to install multiple python versions, and set the python version on your project's root directory.

### Use venv, setup.py, and vex to manage dependencies and your virtual environment

I've grown out of love with pipenv, it's more effort than it is worth.

So here's what you should be doing. Everything should be written as a python package, even applications, just package them already and thank yourself later.

#### 1. Manage your packages in setup.py

- Dependencies go into setup.py `install_requires`
- Development dependencies go into `extras_requires`

Here's a nice [skeleton for setup.py](https://github.com/kennethreitz/setup.py/blob/master/setup.py).

#### 2. Manage your virtual environment with venv, and vex

- Create it in your project folder `python3 -m venv .venv`
- Run a shell with it `vex --path .venv`
- Install your package `pip3 install -e '.[dev]'` (where `dev` is an EXTRAS dictionary of development dependencies)

### Version your packages

Now that everything you work on is a package, version it. Use [bumpversion](https://pypi.org/project/bumpversion/). Tag it in your repo, use [gitflow](https://github.com/petervanderdoes/gitflow-avh).

### Unit Tests, and Integration Tests

Write two tests, Unit Tests and Integration Tests. Where:

1. Unit Tests are just the ol' reliable testing, and
2. Write Integration Tests such that they are sample use-cases of your API as a consumer, this will also provide a nice set of examples on how to use your APIs for your colleagues

Use the [Mock](https://docs.python.org/3/library/unittest.mock.html) class a lot more in your tests, separate test responsibilities.

### Read a book

Lastly, I highly recommend the [Standard Library Cookbook](https://www.amazon.com/Modern-Python-Standard-Library-Cookbook-ebook/dp/B07C5Q59ZZ) by Alessandro Molina. A few samples are discussed in [Talk Python to Me #197](https://talkpython.fm/episodes/show/197/modern-python-standard-library-cookbook). Go and check it out.


tags: python
