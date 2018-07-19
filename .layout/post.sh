#!/bin/bash

cat << _EOF_
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
      <title>$(echo $POST_TITLE) - Manila Functional</title>
      <link href="https://fonts.googleapis.com/css?family=Overpass+Mono:400,700" rel="stylesheet">
      <link href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/obsidian.min.css" rel="stylesheet">
      <link href="data:image/x-icon;base64,AAABAAEAEBAQAAEABAAoAQAAFgAAACgAAAAQAAAAIAAAAAEABAAAAAAAgAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAANjY2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAARERERAAAAAAAAAAAAAAAAEQEBEQAAAAAAAAAAAAAAABEREREAAAAAAAAAAAAAAAARAREBAAAAAAAAAAAAAAAAEREBEQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//wAA//8AAP//AADwDwAA//8AAPKPAAD//wAA8A8AAP//AADyLwAA//8AAPCPAAD//wAA//8AAP//AAD//wAA" rel="icon" type="image/x-icon">
      <style>
        * {
          -webkit-font-smoothing: antialiased;
          -moz-osx-font-smoothing: grayscale;
        }
        body {
          background-color: rgb(27, 27, 27);
          color: #c1c1c1;
          font-size: 16px;
          padding: 1em;
          font-family: 'Overpass Mono', sans-serif;
          line-height: 3ch;
        }
        @media (min-width: 760px) { body { font-size: 17px } }
        article { padding: 0; margin: 1.1em 0; max-width: 87ch; }
        article a { color: #b58900; display: inline-block; }
        article img { max-width: 100% }
        article blockquote { border-left: 1ch solid #313131; padding: 1.5ch 2ch; border-radius: 3px; background-color: #202020; }
        article blockquote,
        article pre { margin: 0; }
        article pre,
        article code { background-color: #2b2b2b; border-radius: 3px; font-family: 'Overpass Mono'; }
        article pre { word-break: break-all; width: 100%; }
        article blockquote :first-of-type { margin-top: 0; }
        article blockquote :last-of-type { margin-bottom: 0; }
        article hr { border: 0; border-bottom: 3px solid #2d2d2d; }
        .heading { font-family: 'Overpass Mono'; margin-bottom: 2ch; }
        .heading a { text-decoration: none; }
        .heading .title { max-width: 650px; font-size: inherit; color: #c9c9c9; display: table-cell; text-transform: uppercase; margin: 0 0 1em; font-weight:bold; line-height: 2.5ch;  }
        .heading .title:hover { text-decoration: underline; }
        .home { display: inline-block; width: 5ch; text-align:right; margin-right: 2ch; }
        .heading .stamp { color: #676767; display: table-cell; width: 5ch; text-align:right; padding-right: 2ch; }
        .home { text-decoration: none; margin-bottom: 1.5em; text-align: left;  color: #cb4b16; } .home:hover { color: #dc322f; }
        .contents > * { margin: 2ch 0; }
        .contents { display: inline-block; max-width: 80ch; vertical-align: top; width: 100%; }
        .contents :first-child { margin-top: 0; }
        h1, h2, h3, h4, h5, h6 { font-size: 1em; font-weight: bold; margin: 2em 0 1em; }
        h1, h2 { text-transform: uppercase; }
        .contents h1 { border-bottom: 2px solid grey;  }
        .contents h2 { border-bottom: 1px solid lightgrey;  }
        .contents h3 { margin-bottom: 0; padding-bottom: 0; }
        .contents > h4,
        .contents > h5,
        .contents > h6 { margin-bottom: 0; }
        .contents > h4 + *,
        .contents > h5 + *,
        .contents > h6 + * { margin-top: 0; }
        .contents h5, .contents h6 { font-weight; normal; }
        .contents h5, .contents h6 { font-style: italic; }
        ul { padding-left: 1.75em; } ol { padding-left: 2.75em; }
        .footnotes { padding: 1em 0 0; font-size: .85em; }
        .footnotes:before { content: 'FOOTNOTES' }
        .footnotes hr { display: none; }
        .footnotes ol { padding-left: 2.85em; line-height: 3ch; }
        .footnote { vertical-align: super; font-size: .85em; text-decoration: none; line-height: 0; }
        .tags { margin-top: 3em; font-size: .85em; }
        .tags a { background-color: #202020; display:inline-block;padding: 0 .5em;border-radius: 4px; }
        .wrap { max-width: 1024px; margin: 0 auto; }
        figure { margin: 0 }
        .hljs { background-color: #202020; }
        footer { margin-top: 5ch; } footer a { color: inherit; }
        footer span { font-size:.85em; color: grey; }
      </style>
    </head>
    <body>
      <div class="wrap">
        <article>
        <div class="heading"><a href="$(echo $POST_URL)"><span class="stamp">$(echo $POST_DATE)</span><h1 class="title">$(echo $POST_TITLE)</h1></a></div>
          <div class="contents">
          $(echo "$POST_CONTENTS")
          <div class="tags">$(for i in $TAGS; do echo "<a href=\"/tag/$i\">$i</a>"; done;)</div>
          </div>
        </article>
        <footer><span>generated with <a href="https://github.com/hmngwy/jenny">jenny</a></span></footer>
      </div>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/highlight.min.js"></script>
      <script>hljs.initHighlightingOnLoad();</script>
    </body>
  </html>
_EOF_
