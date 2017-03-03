# Possibly The Simplest Slideshow Ever

## An alternative plain CSS slideshow solution

_User Interface_

![](https://sleeplessthought.files.wordpress.com/2014/05/image.png)

So you need to let your users create slideshows, and allow your users' readers to conveniently view multiple images in one compact element, likely more than once in a single page. Most slideshow libraries significantly add payload to a site and impacts rendering negatively, of course you don't want to do this. They don't have to be massive beasts.
 
You can use a library and be done with it, but you've spent so much time optimizing your site to the point that a kilobyte saved means a lot.  

I'm going to be straight with you, this right here isn't revolutionary or a perfect solution, and I'm definitely not the first to come up with it. It's just an alternative solution that we don't usually consider. If you're looking for the simplest solution this could be it. If you know a simpler one I would love to [hear it](http://twitter.com/patambrosio). 

It's basically a horizontal scrolling element with the images displayed as inline-blocks. It forgoes traditional slideshow controls and interface to gain a massive payload savings advantage.  

:::slideshow
![](https://placeholdit.imgix.net/~text?txtsize=33&txt=One&w=650&h=250)

![](https://placeholdit.imgix.net/~text?txtsize=33&txt=Two&w=650&h=250)

![](https://placeholdit.imgix.net/~text?txtsize=33&txt=Three&w=650&h=250)

![](https://placeholdit.imgix.net/~text?txtsize=33&txt=Four&w=650&h=250)

![](https://placeholdit.imgix.net/~text?txtsize=33&txt=Five&w=650&h=250)
:::


:::aside
Images are in paragraphs because we are not monsters.
:::

```html
<div class="slides">
  <p><img src="//domain.com/image-one.jpg"></p>
  <p><img src="//domain.com/image-two.jpg"></p>
  <p><img src="//domain.com/image-three.jpg"></p>
</div>
```

```css
.slides {
  -webkit-overflow-scrolling: touch;
  overflow-x: scroll;
  overflow-y: hidden;
  white-space: nowrap;
  max-width: 350px;
}
.slides p {
  vertical-align: top;
  display: inline-block;
  margin: 0;
}
.slides img {
  display: block;
}
```

It's extremely light and gets the job done, none of that cruft that usually comes with slideshow libraries. And most of all, no dependencies. [Here it is again](http://codepen.io/anon/pen/QjjMeY) but in a CodePen.

##### Behavior. 

This will grow in height to the tallest image. You can use a `max-height` to limit this. You can make the width on `.slides` fluid to no disadvantages or breakage. Play with `vertical-align` on `.slides p` to even out or center images with varying heights.

###### A suggestion: 

Add visual hints to let the user know they can swipe horizontally inside this element, like in the example above with the rightwards arrow and image count indicator.

---

The only reason this solution is worth considering is because a lot of devices now have kinetic scrolling, which makes horizontal scrolling much less annoying.

---

###### A few drawbacks.

It should be quite obvious, users without kinetic scrolling would be pissed. For those users it would be wise to apply alternative navigation, like a numbered pagination, or directional buttons. This would require you to use some clever anchoring, or some Javascript but at least not a whole library.

