---
docker_image: theelves/elvish:latest
---

<!--nologo-->

<style type="text/css">
pre.ttyshot {
  line-height: 1.2 !important;
}
.sgr-1 {
  font-weight: bold;
}
.sgr-7 {
  color: white;
  background-color: black;
}
.sgr-31 {
  color: darkred;
}
.sgr-41 {
  background-color: darkred;
}
.sgr-32 {
  color: green;
}
.sgr-42, .sgr-7.sgr-32 {
  background-color: green;
}
.sgr-33 {
  color: goldenrod;
}
.sgr-43, .sgr-7.sgr-33 {
  background-color: goldenrod;
}
.sgr-34 {
  color: blue;
}
.sgr-44, .sgr-7.sgr-34 {
  color: white;
  background-color: blue;
}
.sgr-35 {
  color: darkorchid;
}
.sgr-45, .sgr-7.sgr-35 {
  background-color: darkorchid;
}
.sgr-36 {
  color: darkcyan;
}
.sgr-46, .sgr-7.sgr-36 {
  background-color: darkcyan;
}
.sgr-37 {
  color: lightgray;
}
.sgr-47, .sgr-7.sgr-37 {
  background-color: gray;
}
</style>

[**Elvish**](https://elv.sh/) is a friendly and expressive shell for
Linux, BSDs, macOS and Windows.

## Powerful Pipelines

Text pipelines are intuitive and powerful. However, if your data have
inherently complex structures, passing them through the pipeline
often requires a lot of ad-hoc, hard-to-maintain text processing code.

Pipelines in Elvish can carry structured data, not just text. You can
stream lists, maps and even functions through the pipeline.

<pre class="ttyshot">
<code>~&gt; <span class="sgr-32">curl</span><span class="sgr-"> https://api.github.com/repos/elves/elvish/issues </span><span class="sgr-32">|</span>
     <span class="sgr-32">from-json</span><span class="sgr-"> </span><span class="sgr-32">|</span><span class="sgr-"> </span><span class="sgr-32">each</span><span class="sgr-"> <span class="sgr-35">$explode~</span> </span><span class="sgr-32">|</span>
     <span class="sgr-32">each</span><span class="sgr-"> </span><span class="sgr-1">[</span><span class="sgr-">issue</span><span class="sgr-1">]{</span><span class="sgr-"> </span><span class="sgr-32">echo</span><span class="sgr-"> </span><span class="sgr-35">$issue</span><span class="sgr-1">[</span><span class="sgr-">number</span><span class="sgr-1">]</span><span class="sgr-">: </span><span class="sgr-35">$issue</span><span class="sgr-1">[</span><span class="sgr-">title</span><span class="sgr-1">]</span><span class="sgr-"> </span><span class="sgr-1">}</span><span class="sgr-"> </span><span class="sgr-32">|</span>
     <span class="sgr-32">head</span><span class="sgr-"> -n 11</span>
366: Support searching file from elvish directly
364: Ctrl-C in elvish kills Atom in background
357: Asynchronous syntax highlighting
356: In web backend, run commands with pty IO, not pipe
354: Support multi-line prompts from byte output
353: Completers should detect context in a top-down manner
352: Quoted command names are highlighted randomly
351: keep navigation mode open after command
350: Raw mode requires two presses of ^V
344: Elvish won't compile
343: Possible to suppress job control messages?
</code></pre>

## Intuitive Control Structures

If you know programming, you probably already know how
`if` looks in C. So why learn another syntax?

Control structures in Elvish have an intuitive C-like syntax.

<pre class="ttyshot">
<code>~&gt; <span class="sgr-32">if</span><span class="sgr-"> </span><span class="sgr-35">$true</span><span class="sgr-"> </span><span class="sgr-1">{</span><span class="sgr-"> </span><span class="sgr-32">echo</span><span class="sgr-"> good </span><span class="sgr-1">}</span><span class="sgr-"> </span><span class="sgr-33">else</span><span class="sgr-"> </span><span class="sgr-1">{</span><span class="sgr-"> </span><span class="sgr-32">echo</span><span class="sgr-"> bad </span><span class="sgr-1">}</span>
good
~&gt; <span class="sgr-32">for</span><span class="sgr-"> </span><span class="sgr-35">x</span><span class="sgr-"> </span><span class="sgr-1">[</span><span class="sgr-">lorem ipsum</span><span class="sgr-1">]</span><span class="sgr-"> </span><span class="sgr-1">{</span>
     <span class="sgr-32">echo</span><span class="sgr-"> </span><span class="sgr-35">$x</span><span class="sgr-">.pdf</span>
   <span class="sgr-1">}</span>
lorem.pdf
ipsum.pdf
~&gt; <span class="sgr-32">try</span><span class="sgr-"> </span><span class="sgr-1">{</span>
     <span class="sgr-32">fail</span><span class="sgr-"> </span><span class="sgr-33">&#39;bad error&#39;</span>
   <span class="sgr-1">}</span><span class="sgr-"> </span><span class="sgr-33">except</span><span class="sgr-"> </span><span class="sgr-35">e</span><span class="sgr-"> </span><span class="sgr-1">{</span>
     <span class="sgr-32">echo</span><span class="sgr-"> error </span><span class="sgr-35">$e</span>
   <span class="sgr-1">}</span><span class="sgr-"> </span><span class="sgr-33">else</span><span class="sgr-"> </span><span class="sgr-1">{</span>
     <span class="sgr-32">echo</span><span class="sgr-"> ok</span>
   <span class="sgr-1">}</span>
error ?(fail 'bad error')
</code></pre>

## Directory History

Is `cd /a/long/nested/directory` the first thing you
do every day? Struggling to remember where your logs and
configurations?

Elvish remembers where you have been. Press Ctrl-L and search, like in a
browser.

<pre class="ttyshot">
<code>~&gt;                                           <span class="sgr-7">xiaq@xiaqsmbp</span>
<span class="sgr-1 sgr-37 sgr-45"> LOCATION </span><span class="sgr-"> </span>
<span class="sgr-7">  * ~                                                    </span><span class="sgr-35 sgr-7"> </span>
  * ~/go/src/github.com/elves/elvish                     <span class="sgr-35">│</span>
110 ~/on/elvish-site/code                                <span class="sgr-35">│</span>
 62 ~/on/elvish-site/code/src                            <span class="sgr-35">│</span>
 52 ~/go/src/github.com/elves/elvish/edit                <span class="sgr-35">│</span>
 34 ~/on/elvish-site/code/tty                            <span class="sgr-35">│</span>
 33 ~/on/elvish-site/code/assets                         <span class="sgr-35">│</span>
 32 ~/go/src/github.com/elves/elvish/eval                <span class="sgr-35">│</span>
 26 ~/on/chat-app/code                                   <span class="sgr-35">│</span>
 24 ~/on/elvish-site/code/dst                            <span class="sgr-35">│</span>
 20 ~/go/src/github.com/elves/md-highlighter             <span class="sgr-35">│</span>
 14 ~/on/chat-app/code/public                            <span class="sgr-35">│</span>
 13 ~/.elvish                                            <span class="sgr-35">│</span>
</code></pre>

## Command History

Want to find the magical `ffmpeg` command that you used to
transcode a video file two months ago?

Just dig through your command history with Ctrl-R. Same key, more
useful.

(To be fair, you can do this in bash with `history | grep
ffmpeg`, but it's far fewer keystrokes in Elvish :)

<pre class="ttyshot">
<code>~&gt;                                           <span class="sgr-7">xiaq@xiaqsmbp</span>
<span class="sgr-1 sgr-37 sgr-45"> HISTORY </span><span class="sgr-"> </span>
13345 make tools/ttyshot                                 <span class="sgr-35">│</span>
13346 make                                               <span class="sgr-35">│</span>
13347 ./assets/                                          <span class="sgr-35">│</span>
13348 ls                                                 <span class="sgr-35">│</span>
13349 ls                                                 <span class="sgr-35">│</span>
13350 rm *.png                                           <span class="sgr-35">│</span>
<span class="sgr-7">13351 git st                                             </span><span class="sgr-35">│</span>
13352 ..                                                 <span class="sgr-35">│</span>
13353 git st                                             <span class="sgr-35">│</span>
13354 git add .                                          <span class="sgr-35">│</span>
13355 git st                                             <span class="sgr-35">│</span>
13356 git commit                                         <span class="sgr-35">│</span>
13357 git push                                           <span class="sgr-35">│</span>
</code></pre>

## Built-in File Manager

Power of the shell or convenience of a file manager?

Choose both. Press Ctrl-N to quickly navigate directories and preview
files, with full shell power.

<pre class="ttyshot">
<code>~/go/src/github.com/elves/elvish&gt;            <span class="sgr-7">xiaq@xiaqsmbp</span>
<span class="sgr-1 sgr-37 sgr-45"> NAVIGATING </span><span class="sgr-"> </span>
<span class="sgr-01 sgr-34 sgr-7"> elvish         </span><span class="sgr-">  CONTRIBUTING.md </span><span class="sgr-35 sgr-7"> </span><span class="sgr-">  FROM golang:onbuild </span>
<span class="sgr-01 sgr-34"> fix-for-0.7    </span><span class="sgr-"> </span><span class="sgr- sgr-7"> Dockerfile      </span><span class="sgr-35 sgr-7"> </span><span class="sgr-">                      </span>
<span class="sgr-01 sgr-34"> images         </span><span class="sgr-">  Gopkg.lock      </span><span class="sgr-35 sgr-7"> </span>
<span class="sgr-01 sgr-34"> md-highlighter </span><span class="sgr-">  Gopkg.toml      </span><span class="sgr-35 sgr-7"> </span>
                  LICENSE         <span class="sgr-35 sgr-7"> </span>
                  Makefile        <span class="sgr-35 sgr-7"> </span>
                  README.md       <span class="sgr-35 sgr-7"> </span>
                 <span class="sgr-01 sgr-34"> cover           </span><span class="sgr-35">│</span>
                 <span class="sgr-01 sgr-34"> daemon          </span><span class="sgr-35">│</span>
                 <span class="sgr-01 sgr-34"> edit            </span><span class="sgr-35">│</span>
                 <span class="sgr-01 sgr-34"> errors          </span><span class="sgr-35">│</span>
                 <span class="sgr-01 sgr-34"> eval            </span><span class="sgr-35">│</span>
                 <span class="sgr-01 sgr-34"> getopt          </span><span class="sgr-35">│</span>
</code></pre>

## Next steps

You can explore the official Elvish [website](https://elv.sh/) or the [project](https://github.com/elves/elvish) on GitHub.

You can also improve this playground or create your own.  Please send a PR or open
an issue in [github.com/rootnroll/library](https://github.com/rootnroll/library).
