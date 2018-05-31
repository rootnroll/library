<style type="text/css">
.key span {
  display:none;
}
.key em {
  font-style:normal;
  margin-right:2px;
}
.key em,.key b {
  padding:1px 4px;
  background-color:#fafafa;
  background:linear-gradient(to bottom,#eee 0%,#fafafa 100%);
  border:1px solid #bbb;
  border-radius:3px;
  font-weight:normal;
  white-space:nowrap;
  box-shadow:0 1px 2px #ddd;
}
.fish {
  white-space:-moz-pre-wrap;
  white-space:-pre-wrap;
  white-space:-o-pre-wrap;
  white-space:pre-wrap;
  word-wrap:break-word;
}
.fish {
  margin:1rem 0;
  padding:0.6rem 1rem;
  line-height:1.8rem;
  color:#111;
  background-color:#fafafa;
  border:1px solid #bbb;
  border-radius:0.6rem;
}
.comment,.suggest {
  color:#555;
}
.command,.function,.binary {
  color:#223aa4;
}
.argument,.path,.file {
  color:#5961cf;
}
.operator,.variable,.match,.history {
  color:#1c8885;
}
.string,.string .operator {
  color:#858904;
}
.cli-dark {
  background-color:#222;
  color:#ccc;
  text-shadow:none;
  padding:0.6rem 1.2rem;
  border-radius:0.6rem;
}
.cli-dark .key em, .cli-dark .key b {
  background-color:#ccc;
  box-shadow:0 0.1rem 0 #666;
  border:1px solid #333;
  color:#000;
  padding:0 3px;
}
.cli-dark .comment {
  color:#c33;
}
.cli-dark .command, .cli-dark .function, .cli-dark .binary {
  color:#6159de;
}
.cli-dark .argument, .cli-dark .path, .cli-dark .file {
  color:#00afff;
}
.cli-dark .redirect {
  color:#fff;
}
.cli-dark .operator, .cli-dark .variable, .cli-dark .match, .cli-dark .history {
  color:#2ff;
}
.cli-dark .string {
  color:#b3b206;
}
.cli-dark .suggest, .cli-dark em {
  color:#777;
}
.cli-dark .match {
  color:#2ff;
}
.cli-dark .search_match {
  background-color:#a100a3;
}
.cli-dark .cwd, .cli-dark .prompt .path {
  color:#2f2;
}
.cli-dark .prompt {
  color:#999;
}
.cli-dark .cursor {
  border-bottom:2px solid #3F3;
}
.cli-dark .underline {
  color:#00afff;
  text-decoration:underline;
}
.cli-dark .error, .cli-dark .error .path {
  color:#f55;
  font-weight:bold;
}
</style>

`fish` is a fully-equipped command line shell (like bash or zsh) that is smart and user-friendly. `fish` supports powerful features like syntax highlighting, autosuggestions, and tab completions that just work, with nothing to learn or configure.

# Running Commands

`fish` runs commands like other shells: you type a command, followed by its arguments. Spaces are separators:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">echo</span> <span class="argument">hello</span> <span class="argument">world</span>
<span class="output">hello world</span>
</pre>

You can include a literal space in an argument with a backslash, or by using single or double quotes:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary"><span class="argument">mkdir</span></span> <span class="path">My\ Files</span>
<span class="prompt">&gt;</span> <span class="binary">cp</span> <span class="path">~/Some\ File</span> <span class="string">'My Files'</span>
<span class="prompt">&gt;</span> <span class="binary">ls</span> <span class="string">"My Files"</span>
<span class="output">Some File</span>
</pre>

Commands can be chained with semicolons.

# Getting Help

`fish` has excellent help and man pages. Run `help` to open help in a web browser, and `man` to open it in a man page. You can also ask for help with a specific command, for example, `help set` to open in a web browser, or `man set` to see it in the terminal.

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary">man</span> <span class="argument">set</span>
<span class="output">set - handle shell variables</span>
<span class="output">  Synopsis...</span>
</pre>

# Syntax Highlighting

You'll quickly notice that `fish` performs syntax highlighting as you type. Invalid commands are colored red by default:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="error">/bin/mkd</span>
</pre>

A command may be invalid because it does not exist, or refers to a file that you cannot execute. When the command becomes valid, it is shown in a different color:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="path">/bin/mkdir</span>
</pre>

`fish` will underline valid file paths as you type them:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary">cat</span> <span class="underline">~/somefi</span><span class="cursor"> </span>
</pre>

This tells you that there exists a file that starts with `somefi`, which is useful feedback as you type.

These colors, and many more, can be changed by running `fish_config`, or by modifying variables directly.

# Wildcards

`fish` supports the familiar wildcard `*`. To list all JPEG files:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary">ls</span> <span class="file">*.jpg</span>
<span class="output">lena.jpg</span>
<span class="output">meena.jpg</span>
<span class="output">santa maria.jpg</span>
</pre>

You can include multiple wildcards:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary">ls</span> <span class="file">l*.p*</span>
<span class="output">lena.png</span>
<span class="output">lesson.pdf</span>
</pre>

Especially powerful is the recursive wildcard `**` which searches directories recursively:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary">ls</span> <span class="path">/var/**.log</span>
<span class="output">/var/log/system.log</span>
<span class="output">/var/run/sntp.log</span>
</pre>

If that directory traversal is taking a long time, you can <span class="key"><em>Control</em><span>-</span><b>C</b></span> out of it.

# Pipes and Redirections

You can pipe between commands with the usual vertical bar:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">echo</span> <span class="argument">hello</span> <span class="argument">world</span> <span class="redirect">|</span> <span class="binary">wc</span>
<span class="output">       1       2      12</span>
</pre>

stdin and stdout can be redirected via the familiar < and >. Unlike other shells, stderr is redirected with a caret ^

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary">grep</span> <span class="argument">fish</span> <span class="redirect">&lt; /etc/shells</span> <span class="redirect">&gt; ~/output.txt</span> <span class="redirect">^ ~/errors.txt</span>
</pre>

# Autosuggestions

`fish` suggests commands as you type, and shows the suggestion to the right of the cursor, in gray. For example:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="error">/bin/h</span><span class="suggest"><span class="cursor">o</span>stname</span>
</pre>

It knows about paths and options:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary">grep</span> <span class="argument">--i</span><span class="suggest"><span class="cursor">g</span>nore-case</span>
</pre>

And history too. Type a command once, and you can re-summon it by just typing a few letters:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="error">r<span class="redirect">&lt;</span></span>\@args{ync} \ <span class="argument">ssh</span> <span class="argument">.</span> <span class="argument">myname</span><span>@</span>somelonghost.com:/some/long/path/doo/dee/doo/dee/doo}
</pre>

To accept the autosuggestion, hit <span class="key"><b>→</b></span> or <span class="key"><em>Control</em><span>-</span><b>F</b></span>. To accept a single word of the autosuggestion, <span class="key"><em>Alt</em><span>-</span><b>→</b></span> (right arrow). If the autosuggestion is not what you want, just ignore it.

# Tab Completions

`fish` comes with a rich set of tab completions, that work "out of the box."

Press <span class="key"><b>Tab</b></span>, and `fish` will attempt to complete the command, argument, or path:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="error">/pri</span> <span>@</span>key{Tab} → <span class="path">/private/</span>
</pre>

If there's more than one possibility, it will list them:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="error">~/stuff/s</span> <span>@</span>key{Tab}
<span class="output">~/stuff/s</span>cript.sh  <em>(Executable, 4.8kB)</em>  <span class="match">~/stuff/sources/  <em>(Directory)</em></span>
</pre>

Hit tab again to cycle through the possibilities.

`fish` can also complete many commands, like git branches:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary">git</span> <span class="argument">merge</span> <span class="argument">pr</span> <span>@</span>key{Tab} → <span class="binary">git</span> <span class="argument">merge</span> <span class="argument">prompt_designer</span>
<span class="prompt">&gt;</span> <span class="binary">git</span> <span class="argument">checkout</span> <span class="argument">b</span> <span>@</span>key{Tab}
<span class="output">b</span>uiltin_list_io_merge <em>(Branch)</em> <span class="match">builtin_set_color <em>(Branch)</em> busted_events <em>(Tag)</em></span>
</pre>

Try hitting tab and see what `fish` can do!

# Variables

Like other shells, a dollar sign performs variable substitution:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">echo</span> <span class="argument">My</span> <span class="argument">home</span> <span class="argument">directory</span> <span class="argument">is</span> <span class="variable"><span class="operator">$</span>HOME</span>
<span class="output">My home directory is /home/tutorial</span>
</pre>

Variable substitution also occurs in double quotes, but not single quotes:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">echo</span> <span class="string">"My current directory is $PWD"</span>
<span class="output">My current directory is /home/tutorial</span>
<span class="prompt">&gt;</span> <span class="command">echo</span> <span class="string">'My current directory is $PWD'</span>
<span class="output">My current directory is $PWD</span>
</pre>

Unlike other shells, `fish` has no dedicated syntax for setting variables. Instead it has an ordinary command: `set`, which takes a variable name, and then its value.

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">set</span> <span class="argument">name</span> <span class="string">'Mister Noodle'</span>
<span class="prompt">&gt;</span> <span class="command">echo</span> <span class="variable"><span class="operator">$</span>name</span>
<span class="output">Mister Noodle</span>
</pre>

(Notice the quotes: without them, `Mister` and `Noodle` would have been separate arguments, and `$name` would have been made into a list of two elements.)

Unlike other shells, variables are not further split after substitution:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary"><span class="argument">mkdir</span></span> <span class="variable"><span class="operator">$</span>name</span>
<span class="prompt">&gt;</span> <span class="binary">ls</span>
<span class="output">Mister Noodle</span>
</pre>

In bash, this would have created two directories "Mister" and "Noodle". In `fish`, it created only one: the variable had the value "Mister Noodle", so that is the argument that was passed to `mkdir`, spaces and all. Other shells use the term "arrays", rather than lists.

# Exit Status

Unlike other shells, `fish` stores the exit status of the last command in `$status` instead of `$?`.

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">false</span>
<span class="prompt">&gt;</span> <span class="command">echo</span> <span class="variable"><span class="operator">$</span>status</span>
<span class="output">1</span>
</pre>

Zero is considered success, and non-zero is failure.

# Exports (Shell Variables)

Unlike other shells, `fish` does not have an export command. Instead, a variable is exported via an option to `set`, either `--export` or just `-x`.

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">set</span> <span class="argument">-x</span> <span class="argument">MyVariable</span> <span class="argument">SomeValue</span>
<span class="prompt">&gt;</span> <span class="binary">env</span> <span class="redirect">|</span> <span class="binary">grep</span> <span class="argument">MyVariable</span>
<span class="output"><span class="match">MyVariablem</span>=SomeValue</span>
</pre>

You can erase a variable with `-e` or `--erase`

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">set</span> <span class="argument">-e</span> <span class="argument">MyVariable</span>
<span class="prompt">&gt;</span> <span class="binary">env</span> <span class="redirect">|</span> <span class="binary">grep</span> <span class="argument">MyVariable</span>
<span class="output">(no output)</span>
</pre>

# <a class="anchor" id="tut_lists"></a>Lists

The `set` command above used quotes to ensure that `Mister Noodle` was one argument. If it had been two arguments, then `name` would have been a list of length 2. In fact, all variables in `fish` are really lists, that can contain any number of values, or none at all.

Some variables, like `$PWD`, only have one value. By convention, we talk about that variable's value, but we really mean its first (and only) value.

Other variables, like `$PATH`, really do have multiple values. During variable expansion, the variable expands to become multiple arguments:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">echo</span> <span class="variable"><span class="operator">$</span>PATH</span>
<span class="output">/usr/bin /bin /usr/sbin /sbin /usr/local/bin</span>
</pre>

Note that there are three environment variables that are automatically split on colons to become lists when fish starts running: `PATH`, `CDPATH`, `MANPATH`. Conversely, they are joined on colons when exported to subcommands. All other environment variables (e.g., `LD_LIBRARY_PATH`) which have similar semantics are treated as simple strings.

Lists cannot contain other lists: there is no recursion. A variable is a list of strings, full stop.

Get the length of a list with `count`:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">count</span> <span class="variable"><span class="operator">$</span>PATH</span>
<span class="output">5</span>
</pre>

You can append (or prepend) to a list by setting the list to itself, with some additional arguments. Here we append /usr/local/bin to $PATH:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">set</span> <span class="argument">PATH</span> <span class="variable"><span class="operator">$</span>PATH</span> <span class="path">/usr/local/bin</span>
</pre>

You can access individual elements with square brackets. Indexing starts at 1 from the beginning, and -1 from the end:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">echo</span> <span class="variable"><span class="operator">$</span>PATH</span>
<span class="output">/usr/bin /bin /usr/sbin /sbin /usr/local/bin</span>
<span class="prompt">&gt;</span> <span class="command">echo</span> <span class="variable"><span class="operator">$</span>PATH</span><span class="argument">[1]</span>
<span class="output">/usr/bin</span>
<span class="prompt">&gt;</span> <span class="command">echo</span> <span class="variable"><span class="operator">$</span>PATH</span><span class="argument">[-1]</span>
<span class="output">/usr/local/bin</span>
</pre>

You can also access ranges of elements, known as "slices:"

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">echo</span> <span class="variable"><span class="operator">$</span>PATH</span><span class="argument">[1..2]</span>
<span class="output">/usr/bin /bin</span>
<span class="prompt">&gt;</span> <span class="command">echo</span> <span class="variable"><span class="operator">$</span>PATH</span><span class="argument">[-1..2]</span>
<span class="output">/usr/local/bin /sbin /usr/sbin /bin</span>
</pre>

You can iterate over a list (or a slice) with a for loop:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">for</span> <span class="argument">val</span> <span class="command">in</span> <span class="variable"><span class="operator">$</span>PATH</span>
    <span class="command">echo</span> <span class="string">"entry: $val"</span>
  <span class="command">end</span>
<span class="output">entry: /usr/bin/</span>
<span class="output">entry: /bin</span>
<span class="output">entry: /usr/sbin</span>
<span class="output">entry: /sbin</span>
<span class="output">entry: /usr/local/bin</span>
</pre>

Lists adjacent to other lists or strings are expanded as [cartesian products](https://fishshell.com/docs/current/index.html#cartesian-product) unless quoted (see [Variable expansion](https://fishshell.com/docs/current/index.html#expand-variable)):

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">set</span> <span class="argument">-l</span> <span class="argument">a</span> <span class="argument">1</span> <span class="argument">2</span> <span class="argument">3</span>
<span class="prompt">&gt;</span> <span class="command">set</span> <span class="argument">-l</span> <span class="argument">1</span> <span class="argument">a</span> <span class="argument">b</span> <span class="argument">c</span>
<span class="prompt">&gt;</span> <span class="command">echo</span> <span class="variable"><span class="operator">$</span>a</span><span class="variable"><span class="operator">$</span>1</span>
<span class="output">1a 2a 3a 1b 2b 3b 1c 2c 3c</span>
<span class="prompt">&gt;</span> <span class="command">echo</span> <span class="variable"><span class="operator">$</span>a</span><span class="string">" banana"</span>
<span class="output">1 banana 2 banana 3 banana</span>
<span class="prompt">&gt;</span> <span class="command">echo</span> <span class="string">"$a banana"</span>
<span class="output">1 2 3 banana</span>
</pre>

This is similar to [Brace expansion](https://fishshell.com/docs/current/index.html#expand-brace).

# Command Substitutions

Command substitutions use the output of one command as an argument to another. Unlike other shells, `fish` does not use backticks ` for command substitutions. Instead, it uses parentheses:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">echo</span> <span class="argument">In</span> <span class="operator">(</span><span class="command">pwd</span><span class="operator">)</span>, <span class="argument">running</span> <span class="operator">(</span><span class="binary">uname</span><span class="operator">)</span>
<span class="output">In /home/tutorial, running FreeBSD</span>
</pre>

A common idiom is to capture the output of a command in a variable:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">set</span> <span class="argument">os</span> <span class="operator">(</span><span class="binary">uname</span><span class="operator">)</span>
<span class="prompt">&gt;</span> <span class="command">echo</span> <span class="variable"><span class="operator">$</span>os</span>
<span class="output">Linux</span>
</pre>

Command substitutions are not expanded within quotes. Instead, you can temporarily close the quotes, add the command substitution, and reopen them, all in the same argument:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary">touch</span> <em><span class="string">"testing_"</span></em><span class="operator">(</span><span class="binary">date</span> <span class="argument">+<span>%</span>s</span><span class="operator">)</span><em><span class="string">".txt"</span></em>
<span class="prompt">&gt;</span> <span class="binary">ls</span> <span class="file">*.txt</span>
<span class="output">testing_1360099791.txt</span>
</pre>

Unlike other shells, fish does not split command substitutions on any whitespace (like spaces or tabs), only newlines. This can be an issue with commands like `pkg-config` that print what is meant to be multiple arguments on a single line. To split it on spaces too, use `string split`.

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">printf</span> <span class="string">'<span>%</span>s<span>\</span>n'</span> <span class="operator">(</span><span class="binary"><span class="argument">pkg</span>-config</span> <span class="argument">--libs</span> <span class="file">gio-2.0</span><span class="operator">)</span>
<span class="output">-lgio-2.0 -lgobject-2.0 -lglib-2.0</span>
<span class="prompt">&gt;</span> <span class="command">printf</span> <span class="string">'<span>%</span>s<span>\</span>n'</span> <span class="operator">(</span><span class="binary"><span class="argument">pkg</span>-config</span> <span class="argument">--libs</span> <span class="file">gio-2.0</span> <span class="redirect">|</span> <span class="command">string</span> <span class="argument">split</span> <span class="string">" "</span><span class="operator">)</span>
<span class="output">-lgio-2.0
<span class="file">-lgobject-2.0</span>
<span class="file">-lglib-2.0</span></span>
</pre>

# <a class="anchor" id="tut_semicolon"></a>Separating Commands (Semicolon)

Like other shells, fish allows multiple commands either on separate lines or the same line.

To write them on the same line, use the semicolon (";"). That means the following two examples are equivalent:

<pre class="fish"><span class="command">echo</span> <span class="argument">fish</span><span class="redirect">;</span> <span class="command">echo</span> <span class="argument">chips</span>

<span class="comment"># or</span>
<span class="command">echo</span> <span class="argument">fish</span>
<span class="command">echo</span> <span class="argument">chips</span>
</pre>

# <a class="anchor" id="tut_combiners"></a>Combiners (And, Or, Not)

Unlike other shells, `fish` does not have special syntax like && or || to combine commands. Instead it has commands `and`, `or`, and `not`.

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary">cp</span> <span class="file">file1.txt</span> <span class="file">file1_bak.txt</span><span class="redirect">;</span> <span class="command">and</span> <span class="command">echo</span> <span class="string">"Backup successful"</span><span class="redirect">;</span> <span class="command">or</span> <span class="command">echo</span> <span class="string">"Backup failed"</span>
<span class="output">Backup failed</span>
</pre>

As mentioned in [the section on the semicolon](#tut_semicolon), this can also be written in multiple lines, like so:

<pre class="fish"><span class="binary">cp</span> <span class="file">file1.txt</span> <span class="file">file1_bak.txt</span>
<span class="command">and</span> <span class="command">echo</span> <span class="string">"Backup successful"</span>
<span class="command">or</span> <span class="command">echo</span> <span class="string">"Backup failed"</span>
</pre>

# Conditionals (If, Else, Switch)

Use `if`, `else if`, and `else` to conditionally execute code, based on the exit status of a command.

<pre class="fish cli-dark"><span class="command">if</span> <span class="binary">grep</span> <span class="argument">fish</span> <span class="path">/etc/shells</span>
    <span class="command">echo</span> <span class="argument">Found</span> <span class="argument">fish</span>
<span class="command">else</span> <span class="command">if</span> <span class="binary">grep</span> <span class="argument">bash</span> <span class="path">/etc/shells</span>
    <span class="command">echo</span> <span class="argument">Found</span> <span class="argument">bash</span>
<span class="command">else</span>
    <span class="command">echo</span> <span class="argument">Got</span> <span class="argument">nothing</span>
<span class="command">end</span>
</pre>

[Combiners](#tut_combiners) can also be used to make more complex conditions, like

<pre class="fish"><span class="command">if</span> <span class="binary">grep</span> <span class="argument">fish</span> <span class="path">/etc/shells</span><span class="redirect">;</span> <span class="command">and</span> <span class="command">command</span> <span class="argument">-sq</span> <span class="argument">fish</span>
    <span class="command">echo</span> <span class="argument">fish</span> <span class="argument">is</span> <span class="argument">installed</span> <span class="argument">and</span> <span class="argument">configured</span>
<span class="command">end</span>
</pre>

For even more complex conditions, use `begin` and `end` to group parts of them.

There is also a `switch` command:

<pre class="fish cli-dark"><span class="command">switch</span> <span class="operator">(</span><span class="binary">uname</span><span class="operator">)</span>
<span class="command">case</span> <span class="argument">Linux</span>
    <span class="command">echo</span> <span class="argument">Hi</span> <span class="argument">Tux!</span>
<span class="command">case</span> <span class="argument">Darwin</span>
    <span class="command">echo</span> <span class="argument">Hi</span> <span class="argument">Hexley!</span>
<span class="command">case</span> <span class="argument">FreeBSD</span> <span class="argument">NetBSD</span> <span class="argument">DragonFly</span>
    <span class="command">echo</span> <span class="argument">Hi</span> <span class="argument">Beastie!</span>
<span class="command">case</span> <span class="string">'*'</span>
    <span class="command">echo</span> <span class="argument">Hi,</span> <span class="argument">stranger!</span>
<span class="command">end</span>
</pre>

Note that `case` does not fall through, and can accept multiple arguments or (quoted) wildcards.

# Functions

A `fish` function is a list of commands, which may optionally take arguments. Unlike other shells, arguments are not passed in "numbered variables" like `$1`, but instead in a single list `$argv`. To create a function, use the `function` builtin:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">function</span> <span class="argument">say_hello</span>
     <span class="command">echo</span> <span class="argument">Hello</span> <span class="variable"><span class="operator">$</span>argv</span>
  <span class="command">end</span>
<span class="prompt">&gt;</span> <span class="argument">say_hello</span>
<span class="output">Hello</span>
<span class="prompt">&gt;</span> <span class="argument">say_hello</span> <span class="argument">everybody!</span>
<span class="output">Hello everybody!</span>
</pre>

Unlike other shells, `fish` does not have aliases or special prompt syntax. Functions take their place.

You can list the names of all functions with the `functions` keyword (note the plural!). `fish` starts out with a number of functions:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">functions</span>
<span class="output">alias, cd, delete-or-exit, dirh, dirs, down-or-search, eval, export, fish_command_not_found_setup, fish_config, fish_default_key_bindings, fish_prompt, fish_right_prompt, fish_sigtrap_handler, fish_update_completions, funced, funcsave, grep, help, history, isatty, ls, man, math, nextd, nextd-or-forward-word, open, popd, prevd, prevd-or-backward-word, prompt_pwd, psub, pushd, seq, setenv, trap, type, umask, up-or-search, vared</span>
</pre>

You can see the source for any function by passing its name to `functions`:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">functions</span> <span class="argument">ls</span>
<span class="command">function</span> <span class="argument">ls</span> <span class="argument">--description</span> <span class="string">'List contents of directory'</span>
    <span class="command">command</span> <span class="binary">ls</span> <span class="argument">-G</span> <span class="variable"><span class="operator">$</span>argv</span>
<span class="command">end</span>
</pre>

# Loops

While loops:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">while</span> <span class="argument">true</span>
    <span class="command">echo</span> <em><span class="string">"Loop forever"</span></em>
<span class="command">end</span>
<span class="output">Loop forever</span>
<span class="output">Loop forever</span>
<span class="output">Loop forever</span>
<span class="output">...</span>
</pre>

For loops can be used to iterate over a list. For example, a list of files:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">for</span> <span class="argument">file</span> <span class="command">in</span> <span class="file">*.txt</span>
    <span class="binary">cp</span> <span class="variable"><span class="operator">$</span>file</span> <span class="variable"><span class="operator">$</span>file</span><span class="argument">.bak</span>
<span class="command">end</span>
</pre>

Iterating over a list of numbers can be done with `seq`:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">for</span> <span class="argument">x</span> <span class="command">in</span> <span class="operator">(</span><span class="binary">seq</span> <span class="argument">5</span><span class="operator">)</span>
    <span class="binary">touch</span> <span class="argument">file_</span><span class="variable"><span class="operator">$</span>x</span><span class="argument">.txt</span>
<span class="command">end</span>
</pre>

# <a class="anchor" id="tut_prompt"></a>Prompt

Unlike other shells, there is no prompt variable like PS1. To display your prompt, `fish` executes a function with the name `fish_prompt`, and its output is used as the prompt.

You can define your own prompt:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">function</span> <span class="argument">fish_prompt</span>
    <span class="command">echo</span> <span class="string">"New Prompt % "</span>
<span class="command">end</span>
New Prompt % <span class="cursor"> </span>
</pre>

Multiple lines are OK. Colors can be set via `set_color`, passing it named ANSI colors, or hex RGB values:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">function</span> <span class="argument">fish_prompt</span>
      <span class="command">set_color</span> <span class="argument">purple</span>
      <span class="binary">date</span> <span class="string">"+<span>%</span>m/<span>%</span>d/<span>%</span>y"</span>
      <span class="command">set_color</span> <span class="argument">FF0</span>
      <span class="command">echo</span> <span class="operator">(</span><span class="command">pwd</span><span class="operator">)</span> <span class="string">'&gt;'</span>
      <span class="command">set_color</span> <span class="argument">normal</span>
  <span class="command">end</span>
<span style="color: purple">02/06/13</span>
<span style="color: #FF0">/home/tutorial &gt;</span><span class="cursor"> </span>
</pre>

You can choose among some sample prompts by running `fish_config prompt`. `fish` also supports RPROMPT through `fish_right_prompt`.

# $PATH

`$PATH` is an environment variable containing the directories in which `fish` searches for commands. Unlike other shells, $PATH is a [list](#tut_lists), not a colon-delimited string.

To prepend /usr/local/bin and /usr/sbin to `$PATH`, you can write:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">set</span> <span class="argument">PATH</span> <span class="path">/usr/local/bin</span> <span class="path">/usr/sbin</span> <span class="variable"><span class="operator">$</span>PATH</span>
</pre>

To remove /usr/local/bin from `$PATH`, you can write:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">set</span> <span class="argument">PATH</span> <span class="operator">(</span><span class="command">string</span> <span class="argument">match</span> <span class="argument">-v</span> <span class="path">/usr/local/bin</span> <span class="variable"><span class="operator">$</span>PATH</span><span class="operator">)</span>
</pre>

You can do so directly in `config.fish`, like you might do in other shells with `.profile`. See [this example](#path_example).

A faster way is to modify the `$fish_user_paths` [universal variable](#tut_universal), which is automatically prepended to `$PATH`. For example, to permanently add `/usr/local/bin` to your `$PATH`, you could write:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">set</span> <span class="argument">-U</span> <span class="argument">fish_user_paths</span> <span class="path">/usr/local/bin</span> <span class="variable"><span class="operator">$</span>fish_user_paths</span>
</pre>

The advantage is that you don't have to go mucking around in files: just run this once at the command line, and it will affect the current session and all future instances too. (Note: you should NOT add this line to `config.fish`. If you do, the variable will get longer each time you run fish!)

# Startup (Where's .bashrc?)

`fish` starts by executing commands in `~/.config/fish/config.fish`. You can create it if it does not exist.

It is possible to directly create functions and variables in `config.fish` file, using the commands shown above. For example:

<a class="anchor" id="path_example"></a>
<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary">cat</span> <span class="path">~/.config/fish/config.fish</span>

<span class="command">set</span> <span class="argument">-x</span> <span class="argument">PATH</span> <span class="variable"><span class="operator">$</span>PATH</span> <span class="path">/sbin/</span>

<span class="command">function</span> <span class="argument">ll</span>
    <span class="binary">ls</span> <span class="argument">-lh</span> <span class="variable"><span class="operator">$</span>argv</span>
<span class="command">end</span>
</pre>

However, it is more common and efficient to use autoloading functions and universal variables.

# Autoloading Functions

When `fish` encounters a command, it attempts to autoload a function for that command, by looking for a file with the name of that command in `~/.config/fish/functions/`.

For example, if you wanted to have a function `ll`, you would add a text file `ll.fish` to `~/.config/fish/functions`:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary">cat</span> <span class="path">~/.config/fish/functions/ll.fish</span>
<span class="command">function</span> <span class="argument">ll</span>
    <span class="binary">ls</span> <span class="argument">-lh</span> <span class="variable"><span class="operator">$</span>argv</span>
<span class="command">end</span>
</pre>

This is the preferred way to define your prompt as well:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="binary">cat</span> <span class="path">~/.config/fish/functions/fish_prompt.fish</span>
<span class="command">function</span> <span class="argument">fish_prompt</span>
    <span class="command">echo</span> <span class="operator">(</span><span class="command">pwd</span><span class="operator">)</span> <span class="string">"&gt; "</span>
<span class="command">end</span>
</pre>

See the documentation for [funced](https://fishshell.com/docs/current/commands.html#funced) and [funcsave](https://fishshell.com/docs/current/commands.html#funcsave) for ways to create these files automatically.

# <a class="anchor" id="tut_universal"></a>Universal Variables

A universal variable is a variable whose value is shared across all instances of `fish`, now and in the future – even after a reboot. You can make a variable universal with `set -U`:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">set</span> <span class="argument">-U</span> <span class="argument">EDITOR</span> <span class="argument">vim</span>
</pre>

Now in another shell:

<pre class="fish cli-dark"><span class="prompt">&gt;</span> <span class="command">echo</span> <span class="variable"><span class="operator">$</span>EDITOR</span>
<span class="binary">vim</span>
</pre>

# Ready for more?

If you want to learn more about fish, there is [lots of detailed documentation](https://fishshell.com/docs/current/index.html), an [official mailing list](https://lists.sourceforge.net/lists/listinfo/fish-users), the IRC channel #fish on `irc.oftc.net`, and the [github page](https://github.com/fish-shell/fish-shell/).
