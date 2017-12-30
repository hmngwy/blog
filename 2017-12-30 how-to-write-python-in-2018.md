# Writing Python in 2018


### Use Python 3

Use Python 3.

### Read PEP 20

`python -m this`, every now and again.

If there's anything to emphasize here that directly influences day-to-day writing, they are:

- Explicit is better than implicit
- Flat is better than nested
- Sparse is better than dense
- If the implementation is hard to explain, it's a bad idea

### Write Docstrings

PEP257 specifies base Docstring conventions, however format is not-included. People usually choose between reST, Google style, and Numpydoc, the latter two being the most popular. 

### Write Examples and "Test" Them

`doctest` runs examples formatted like so in your Docstrings: 

```
> factorial(5)
120
```

If the output of the `>` line equals to the following line, your example passes. It tests every line that has an expected literal result.

This makes sure you write up to date examples, in case your API changes.

### Use Linters

`flake8` is `pyflakes`, `pycodestyle`, and McCabe script in one. However, `flake8` does not catch some import and object issues like `pylint`, but `pylint` can be slow.

So consider this: 

- For real-time linting, use `flake8`
- For on-save linting, use `pylint`

Additionally, I like using `pydocstyle` for consistent looking Docstrings.

#### Is your project OSS? Do your teammates hate linters?

Use [pre-commit](http://pre-commit.com/hooks.html) hooks.

Commit your `.pylintrc`, enforce the use of `pre-commit` hooks for `pylint`, `pydocstyle`, and `pycodestyle`.

### Package your Project

Learn how to use `setup.py`, and keep your abstract dependencies under its `install_requires`. 

Required reading: [setup.py vs requirements.txt](https://caremad.io/posts/2013/07/setup-vs-requirement/)

#### Use Pipfiles, forget requirements.txt, forget virtualenvs

Install `pipenv` and never look back. This will manage your venvs and your concrete dependencies.

Almost every time, you will have the following in your Pipfile:

```
[packages]
"-e ." = "*"
```

Bonus reading: [pipenv#209](https://github.com/pypa/pipenv/issues/209)

### Unit Test

Use `pytest`, tests folder in project root, [avoid](https://pytest.readthedocs.io/en/2.7.3/goodpractises.html) `__init__.py` files in your tests folder. 

This ensures your tests can be run against an installed version of your package, i.e. `-e .`.

Strive for 100% Test Coverage, `pipenv install pytest-cov --dev`.

### Pick out Best Practices you like

But not everything is up for discussion, don't be a heathen and choose tabs over spaces.

- [BOBP Guide for Python](https://gist.github.com/sloria/7001839)
- [Hitchhiker's Guide to Python](http://docs.python-guide.org/en/latest/)

### Things you have to learn

1. [Decorators](https://www.thecodeship.com/patterns/guide-to-python-function-decorators/con)
2. [Context Managers](http://book.pythontips.com/en/latest/context_managers.html)
3. [OOP Magic Methods](https://rszalski.github.io/magicmethods/)  
4. [List Comprehension](http://treyhunner.com/2015/12/python-list-comprehensions-now-in-color/)
5. [Generators](https://jeffknupp.com/blog/2013/04/07/improve-your-python-yield-and-generators-explained/)
6. [Iterables vs. Iterators vs. Generators](http://nvie.com/posts/iterators-vs-generators/)

