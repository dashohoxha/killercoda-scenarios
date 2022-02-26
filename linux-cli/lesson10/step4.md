# Here documents

A _here document_ is an additional form of I/O redirection in which we
embed a body of text into our script and feed it into the standard
input of a command. It works like this:

<pre>
command << token

text

token
</pre>

where _command_ is a command that accepts standard input and _token_
is a string used to indicate the end of the embedded text. It should
be at the beginning of the line and should have no trailing spaces.

1. Let's modify the script to use a _here document_:

   `vim sys_info.sh`{{execute}}
   
   `/echo`{{execute}}
   
   `O`{{execute}}
   
   `cat << _EOF_`{{execute no-newline}}
   
   `^ESC`{{execute ctrl-seq}}

   `Go`{{execute no-newline}}
   
   `_EOF_`{{execute no-newline}}

   `^ESC`{{execute ctrl-seq}}

   `:%s/echo "//`{{execute}}
   
   `Gk$x`{{execute}}
   
   `:wq`
   
   `./sys_info.sh`{{execute}}

   Instead of using `echo`, the script now uses `cat` and a _here_
   document.
   
2. The advantage of a _here_ document is that inside the text we can
   use freely single and double quotes, since they are not interpreted
   by the shell as delimiters of a string. For example:
   
   `foo="some text"`{{execute}}
   
   ```
   cat << EOF
   $foo
   "$foo"
   '$foo'
   \$foo
   EOF
   ```{{execute}}

   The shell treats the quotation marks as ordinary characters.
   
3. We also see that the variables inside the text are expanded. To
   prevent variable expanssion we can enclose the token in quotes:

   ```
   cat << "EOF"
   $foo
   "$foo"
   '$foo'
   \$foo
   EOF
   ```{{execute}}

   ```
   cat << 'EOF'
   $foo
   "$foo"
   '$foo'
   \$foo
   EOF
   ```{{execute}}

4. _Here_ documents can be used with any command that accepts standard
   input. For example we can use it with `ftp` to retrieve a file:
   
   `vim ftp1.sh`{{execute}}
   
   `:q!`{{execute}}

   `./ftp1.sh`{{execute}}
   
   If we change the redirection operator from `<<` to `<<-`, the shell
   will ignore the leading tab characters in the here document. This
   allows a here document to be indented, which can improce
   readability.
   
   `vim ftp2.sh`{{execute}}
   
   `:q!`{{execute}}
   
   `./ftp2.sh`{{execute}}
