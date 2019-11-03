# Installation

1. Get the code of `pw`:

   `git clone https://gitlab.com/dashohoxha/pw`{{execute}}
   
   `cd pw/`{{execute}}

2. Build a DEB package and install it:

   `hl deb.sh | less -r`{{execute}}

   `./deb.sh`{{execute}}
   
   `apt install -f ./pw.deb`{{execute}}
   
   `pw -v`{{execute}}
   
   Uninstall the DEB package:
   
   `apt remove pw`{{execute}}
   
   `apt autoremove`{{execute}}
    
   `pw -v`{{execute}}

3. Install from the code:

   `sudo make install`{{execute}}

   Install dependencies as well:
   
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
       qrencode \
       imagemagick
   ```{{execute}}
   
   `pw --version`{{execute}}
   
   Uninstall it:
   
   `sudo make uninstall`{{execute}}

   `pw --version`{{execute}}
   
4. Run all the tests on another terminal:

   T2: `cd ~/pw/tests/`{{execute T2}}
   
   `ls`{{execute}}
   
   `./run.sh t01*`{{execute}}
   
   `prove t01*`{{execute}}

   `./run.sh`{{execute}}
   
5. While the test scripts are running, check the help:

   T1: `cd ~/pw/`{{execute T1}}
   
   `sudo make install`{{execute}}

   `pw --help`{{execute}}
   
   `pw version`{{execute}}
   
   `pw help | less`{{execute}}
   
   `man pw`{{execute}}
   
   `info pw`{{execute}}
   
   
