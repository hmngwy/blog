Series: Web Typography

# Paragraphs in the Web

People spend a lot of time looking at paragraphs, here’s how to invest more time in them as a designer.

This is the first installment of the series Web Typography. The series is about typographical choices available with rudimentary CSS, and little reliance on JS. The series tries not to delve too deeply in code, but instead supplies a rough guide on applying available typographic elements in the web. {intro emphasize excerpt}

### Starting with Paragraphs
Some of these may be obvious or seem like unimportant design decisions, but a well laid out body of text can stand on its own as good design. It is worth investing some time in the finer details of what should be treated as the smallest building block of web design, that is Paragraphs. 

## Spacing and Indentation

We have two spacing options for paragraphs. 

1. The common and modern choice is to have spaced paragraphs. 
2. The less popular yet classic choice is having non-spaced paragraphs, while indenting the first line of immediately succeeding paragraphs to indicate their start.

### Using Spaced Paragraphs
```markdown
A Fox once saw a Crow fly off with a piece of cheese in its beak
and settle on a branch of a tree. "That's for me, as I am a Fox,"
said Master Reynard, and he walked up to the foot of the tree. 

"Good-day, Mistress Crow," he cried. "How well you are looking
to-day: how glossy your feathers; how bright your eye. I feel 
sure your voice must surpass that of other birds, just as your 
figure does; let me hear but one song from you that I may greet
you as the Queen of Birds." 
```

The amount of space depends on your body's point size, but a common value is to be somewhere around 100% of a typeface's height (read: not `line-height`). Use your judgement as a guide, the paragraphs should still flow from one to the other fluidly while reading. 

Not too much that the paragraphs seem not related or disassociated, and not too tight that you can not distinguish one from the next.

### Using Non-spaced Paragraphs
```markdown
A Fox once saw a Crow fly off with a piece of cheese in its beak
and settle on a branch of a tree. "That's for me, as I am a Fox,"
said Master Reynard, and he walked up to the foot of the tree. 
    "Good-day, Mistress Crow," he cried. "How well you are 
looking to-day: how glossy your feathers; how bright your eye. I
feel sure your voice must surpass that of other birds, just as
your figure does; let me hear but one song from you that I may
greet you as the Queen of Birds." 
```

Choosing non-spaced paragraphs means you have to use indentation on the first line. The primary purpose of indentation is for the reader to easily distinguish one paragraph from the next, with most web-fonts at least `1em` would do. The body of this site uses `1.5em` for good measure. Depending on the typeface you choose, you will have to manually gauge how much indentation to use. 

Given the above premise, you should omit indentation on a paragraph directly under a heading or any non-paragraph element, since it's obvious to the reader that is the beginning paragraph. Easily achieved with a `p + p` selector.

## Line Spacing or Leading
Commonly referred to as line height, unfortunately misappropriated in recent years. _Leading_ is the distance between successive lines within a paragraph. The CSS property `line-height` controls this element, it actually manipulates not the distance between two lines, but instead the height of a line including the text itself. The use may somewhat be the same, but the behavior is entirely different. Thus the confusion regarding the terminology.

Obviously, do not use negative line-height for body text. A bad typeface makes you apply negative spacing to make it visually pleasant. If you continue to use such a typeface you will run into problems later down the line. 

#### Pointers:
1. Use positive line spacing that guarantees the user does not re-read a line repeatedly in confusion
2. Make sure that lines in the middle of a paragraph starting with capitals does not look like the beginning of a separate paragraph
3. With most decent web-fonts, a good starting point is to use `1.618em`[^1] in CSS `line-height` and adjust from there. Sometimes as low as `1.3em` works.

[^1]: A List Apart: More Meaningful Typography — [http://alistapart.com/article/more-meaningful-typography](http://alistapart.com/article/more-meaningful-typography)

## Alignment

:::aside
This is a right aligned aside, to disassociate this margin violator from the main body text.
:::

Never unnecessarily right-align body copy in a left-to-right language, and vice versa with left-align. In margin violators use alignment opposite of the side violated. If you're viewing this page in a large screen you will see an aside to the left that is right aligned.

In a two column layout, do not oppositely align neighboring columns if their text belongs to one body. Readers may infer the text as not related, instead apply it when appropriate.

## Measure or Line Length
On the Web this is commonly measured in characters-per-line, or CPL. Some would suggest an amount of words-per-line, but this is much harder to gauge because of words' varied length.

Designers have varied opinion here, some suggest the range 50-60[^2], or the larger 45-75, and some use a more specific value like 66[^3]. Too wide and the user will be susceptible to accidentally re-reading a line. Too narrow and reading will be exhausting due to rapid eye-tracking.

[^2]: Readability: the Optimal Line Length — [http://baymard.com/blog/line-length-readability](http://baymard.com/blog/line-length-readability)
[^3]: Choose a comfortable measure — [http://webtypography.net/2.1.2](http://webtypography.net/2.1.2)

:::aside
For historical reference, over time typewriter manufacturers started using 72 CPL more commonly for A4 sized paper.
:::

On narrower screens you will have to resort to a lower CPL to avoid having to use too small a point size, and also if you want to disable horizontal scrolling (you should). Do not be afraid to use a minimum of `45ch` for smaller screens. While viewing well designed sites in mobile, I can sometimes see at the minimum around `40-50ch`, because of the use-case and the reading medium (touch vertical-only scrolling) this becomes somehow acceptable.

As your breakpoints grow, maximize your CPL as much you can and get closer to your highest CPL sooner rather than later, i.e. have a bias towards your max CPL, sacrificing some margin is acceptable.

## Justification and Hyphenation

:::aside
If you plan to use justification, make sure you are using `EMs`  for your point size and `CH` for your line-width, this way, your CPL does not change when you test out different point sizes.
:::

Good justification works well depending on the typeface used, line length, point size, minimum word spacing, and with proper hyphenation. Note that with justification browsers add space in between words, and sometimes between words and punctuations already separated by space, how each browser decides where to add spaces depends on its design team.

A common problem is too much space between words, albeit visually unpleasant fortunately this is easily identified. Solutions range from increasing the CPL, point size, and as a last resort trying another typeface. You may be averse with the latter solution, and that's understandable, but some typefaces work better with justification than others.

You can use `word-spacing` to define the minimum space between your words, it will allow the browser to compress more words into a line. Do this only if your typeface allows it such that readability doesn't suffer. 

Do not treat justification like text alignment and dismiss it immediately when it doesn't work, at least in the web it is a different element from alignment partly due to automated and opinionated spacing algorithms. With decent web-fonts, there will usually be a CPL and point size sweet-spot for justification.

For smaller screens, do not be hesitant to disable justification, the lower CPL will definitely introduce uninviting space between words. The way justification works on the web is a good reason to treat it as a progressive enhancement. In the end, it is more of an aesthetic choice than a readability-choice. Readability trumps consistency every time. 

#### Pointers:
1. Look out for lines that have too much space in between words, i.e. words in a sentence feel disconnected, lacks fluid flow, and
2. Lines that have too little space, rare, but it may happen
3. Do not feel bad about disabling justification on smaller screens, readability trumps consistency
4. Longer lines usually fixes issues because of increased word resolution, or words per line, but keep to recommended maximum CPL

#### JS Hyphenation
Hyphenation usually solves excessive word spacing when justified. But hyphenation support is absent in Chrome, and designed weakly in Safari and other browsers. The reason being it is an expensive functionality, and requires at least more than one pass of calculation during rendering. In which case performance trumps preciseness.

Until browsers employ good hyphenation algorithms, one should enable available CSS hyphenation and employ a JS hyphenation library as a progressive enhancement. My best recommendation is to use [Hyphenator](https://github.com/mnater/hyphenator). 

Hyphenation on successive lines is a common issue across browsers and JS-based solutions, it is visually unpleasant, but I have yet to encounter a library that only hyphenates one line for every variable number of lines I define. At the time of writing Hyphenator does not support this. 

## Hanging Punctuation

There is a proposed CSS `hanging-punctuation` property that would come in handy if you have to support user input, like in Lilii, the platform this post is served from. At the time of writing there is no browser support for this property, current working solutions are made with JavaScript and are not without drawbacks.

#### Without Hanging Punctuation

```markdown
"Good-day, Mistress Crow," he cried. "How well you are
looking to-day: how glossy your feathers; how bright your eye.
I feel sure your voice must surpass that of other birds, just
as your figure does; let me hear but one song from you that I
may greet you as the Queen of Birds." 
 
The Crow lifted up her head and began to caw her best, but
the moment she opened her mouth the piece of cheese fell to the
ground, only to be snapped up by Master Fox.
```

#### With Hanging Punctuation

```markdown
"Good-day, Mistress Crow," he cried. "How well you are
 looking to-day: how glossy your feathers; how bright your eye.
 I feel sure your voice must surpass that of other birds, just
 as your figure does; let me hear but one song from you that I
 may greet you as the Queen of Birds." 
 
 The Crow lifted up her head and began to caw her best, but
 the moment she opened her mouth the piece of cheese fell to the
 ground, only to be snapped up by Master Fox.
```

Currently, there are two known methods of employing hanging punctuation. Both involve _wrapping_ identified punctuations with an inline tag, and then applying CSS rules to make it fall outside of the paragraph block, which are either:

1. Setting its position to `absolute` and setting `right: 0`, while making sure the parent has `relative` positioning
2. Or giving it a negative `text-indent` or `margin` of the its width in `em`

### Negative Text-Indent method

:::aside
The best way to go about this is to have the values in `EM` so that you can easily scale your point size without having to update the measurements.
:::

[This method requires you to measure punctuation widths](http://webdesign.tutsplus.com/articles/getting-the-hang-of-hanging-punctuation--cms-19890), which are then used as negative `text-indent` on the wrapped punctuations. This is a tedious way to do it but will support hanging punctuations in indented paragraphs, being the adjustment relative to the text instead of the paragraph block.

One drawback is that you will have to make measurements for each typeface with which hanging punctuation will be applied. Another is that this will not support right aligned text efficiently. You will have to add another set of classes for punctuations in the right aligned text, using the same measurements but on a different property. This doubles the amount of CSS required per each typeface.

### Absolute Positioning method

[This is a more efficient method](http://codepen.io/Lane/pen/kufHo/), as the punctuation will drop outside of the paragraph block without specific measurements, and thus will work with variable typefaces.

The drawback is immediately obvious, you cannot use non-spaced paragraphs with this method. Since the adjustment is relative to the block and not the text, the punctuations will still fall outside the block of indented paragraphs. 

#### Indented Paragraph Drawback

```markdown
 A Fox once saw a Crow fly off with a piece of cheese in its beak 
 and settle on a branch of a tree. "That's for me, as I am a Fox,"
 said Master Reynard, and he walked up to the foot of the tree. 
"    Good-day, Mistress Crow," he cried. "How well you are
 looking to-day: how glossy your feathers; how bright your eye.
 I feel sure your voice must surpass that of other birds, just
 as your figure does; let me hear but one song from you that I
 may greet you as the Queen of Birds." 
```

### Right Aligned Text Support

When text is right aligned for left-to-right languages, punctuations at the _end_ of a paragraph are hanged instead of ones at the _start_.
 
The __absolute positioning method__ linked above partially supports this, but it doesn't do so automatically. You will have to mark up right aligned paragraphs with a class, that class then activates hanging _end_ punctuations identified during wrapping, and disables the effect on _start_ punctuations. 

The __negative text-indent method__ however will need some additional work. Like the absolute positioning method, you need to classify _end_ versus _start_ punctuations during wrapping, then mark up right aligned paragraphs with a class. Instead of applying negative `text-indent` for right aligned paragraphs, you use a negative `margin-right` on _end_ punctuations, while disabling the effect on _start_ punctuations.

The proposed CSS property should supposedly detect this and apply the proper hanging alignment without any additional mark up. 

----

This concludes the entry for Paragraphs, part of the series Web Typography. The series will cover more topics in the future, at the end of each installment, I will include an up-to-date list of links and planned topics in the series.

1. [Paragraphs](https://lilii.co/aardvark/paragraphs)
2. Headings
3. Lists
4. Block quotes
5. Inline elements: Links, Footnotes, etc.
6. Asides



