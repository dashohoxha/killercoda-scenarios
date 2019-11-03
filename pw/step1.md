# Installation

1. Make sure that the dependencies are installed:

   ```
   apt install \
       bash \
       make \
       gnupg \
       git \
       xclip \
       pwgen \
       tree \
       util-linux \
       ed \
       qrencode
   ```{{execute}}

2. Get the code of `pw` and install:

   `git clone https://gitlab.com/dashohoxha/pw`{{execute}}
   
   `cd pw/`{{execute}}
   
   `sudo make install`{{execute}}
   
3. Check the help:
   
   `pw --help`{{execute}}
   
   `pw help | less`{{execute}}
   
   `pw version`{{execute}}
   
   `man pw`{{execute}}
   
   `info pw`{{execute}}
   
4. Uninstall:

   `sudo make uninstall`{{execute}}
   
   `pw -v`{{execute}}
   
5. Install from DEB package:

   `less deb.sh`{{execute}}

   `./deb.sh`{{execute}}
   
   `apt install -f ./pw.deb`{{execute}}
   
6. Run all the tests:

   `tests/run.sh`{{execute HOST2}}

   `tests/run.sh`{{execute T2}}
