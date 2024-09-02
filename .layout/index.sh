#!/bin/bash

# Break apart the LIST payload
IFS='✂︎' read -r -a array <<< "$LIST"

function index_loop {
        for (( idx=${#array[@]}-1 ; idx>=0 ; idx-- )) ; do
    [ "${array[idx]}" ] && eval "${array[idx]} list_item"
  done
}

function list_item {
  if [ -z "$BREAK" ]; then
cat << _LOOP_
<li class="post-link $([ $InNext ] && echo "in-next")"><a href="$(echo $URL_PREFIX)$(echo $POST_URL)"><span class="stamp">$(date -d "$POST_DATE_RFC822" +%m/%d/%Y)</span> <span class="title">$(echo $POST_TITLE)</span></a></li>
_LOOP_
  else
    InNext=true
cat << _LOOP_
  <li class="post-link"><a href="./page/$(echo $BREAK).html">Under page $(echo $BREAK)</a></li>
_LOOP_
  fi
}

function nav {
        if [ "$PAGE_OLD" ] || [ "$PAGE_NEW" ]; then
cat << _NAV_
    <nav>
                        $([ "$PAGE_NEW" ] && echo "<a href=\"$PAGE_NEW\">← NEWER</a>")
                        $([ "$PAGE_OLD" ] && echo "<a href=\"$PAGE_OLD\">OLDER →</a>")
                </nav>
_NAV_
        fi
}

cat << _EOF_
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Manila Functional</title>
    <link href="/fira_code.css" rel="stylesheet">
    <link href="data:image/x-icon;base64,AAABAAEAEBAQAAEABAAoAQAAFgAAACgAAAAQAAAAIAAAAAEABAAAAAAAgAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAANjY2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAARERERAAAAAAAAAAAAAAAAEQEBEQAAAAAAAAAAAAAAABEREREAAAAAAAAAAAAAAAARAREBAAAAAAAAAAAAAAAAEREBEQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//wAA//8AAP//AADwDwAA//8AAPKPAAD//wAA8A8AAP//AADyLwAA//8AAPCPAAD//wAA//8AAP//AAD//wAA" rel="icon" type="image/x-icon">
    <style>
      * {
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
      }
      body {
        background-color: rgb(27, 27, 27);
        color: #434343;
        font-size: 16px;
        padding: 1em;
        font-family: 'Fira Code', monospace;
        line-height: 1.75em;
      }
      @media (min-width: 760px) { body { font-size: 17px } }
      a { color: inherit; }
      .posts { list-style: none; padding: 0; margin: 1.33em 0 1em; line-height: 3.14ch; }
      .post-link { display: table; text-transform: uppercase; margin-bottom: .55em; }
      .post-link a { text-decoration: none; line-height:2.5ch; display:inline-block; }
      .post-link .title:hover {  text-decoration: underline;  }
      .post-link .stamp { color: #676767; display: table-cell; width: 5ch; text-align:right; padding-right: 2ch; }
      .post-link .title { color: #e1e1e1; display: table-cell; vertical-align: top;font-weight: 400; }
      nav a { color: #555; text-decoration: none; } nav a:hover { color: #268bd2}
      nav a+a:before { content: ' • '; }
      header { text-transform: uppercase; }
      header a { text-decoration: none } header a:hover { color: #268bd2}
      .wrap { max-width: 1024px; margin: 0 auto; }
      .in-next { opacity: 0.6; }
      .home { position:absolute; margin: 0 -1.25em 0; }
      footer { margin-top: 5ch; } footer a { color: inherit; }
      footer span { font-size:.85em; color: grey; }
    </style>
  </head>
  <body>
    <div class="wrap">
      <header><a href="/">MANILA FUNCTIONAL</a>
      <p>I go by @mailmanpat, I'm a Software Engineer, Proprietor, Tech Leader. These are my thoughts.</p>
      $(if [ "$TAGNAME" ]; then echo "-> TAG == <a href=\"/tag/$TAGNAME\">$TAGNAME</a>"; fi)
      $(if [ "$PAGE_NUM" ]; then echo "-> <a href=\"/page/$PAGE_NUM.html\">Page $PAGE_NUM</a>"; fi)
      </header>

      <ul class="posts">
        $(index_loop)
      </ul>
      $(nav)

      <footer><span><a href="/">home</a> - <a href="/about.html">about</a> - generated with <a href="https://github.com/hmngwy/jenny">jenny</a> - <a href="https://github.com/hmngwy/blog">src</a></span></footer>
    </div>
  </body>
</html>
_EOF_
