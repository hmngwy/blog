# Iterables: List Comprehension

This is part of a series, see (Iterables)[/tag/iterables].

Python list comprehension is a shorthand for generating a list, from one or more iterables.

```python
>>> old_list = ['apple', 'banana', 'coconut']
>>> [item for item in old_list if 'a' in item]
['apple', 'banana']
```

With a for loop you'd do it like so.

```python
>>> new_list = []
>>> for item in old_list:
...   if 'a' in item:
...     new_list.append(item)
>>> new_list
['apple', 'banana']
```

When stored in a variable, note that the whole generated list is stored in memory after the comprehension executes.

tags: python iterables