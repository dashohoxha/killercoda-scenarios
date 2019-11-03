# Installation

1. Get the code of `pw`:

   `git clone https://gitlab.com/dashohoxha/pw`{{execute}}
   
   `cd pw/`{{execute}}

2. Install dependencies:
   
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

3. Install from the code:

   `sudo make install`{{execute}}
   
   `pw --version`{{execute}}
   
   `sudo make uninstall`{{execute}}

   `pw --version`{{execute}}
   
4. Build a DEB package and install it:

   `hl deb.sh`{{execute}}

   `./deb.sh`{{execute}}
   
   `apt install -f ./pw.deb`{{execute}}
   
   `pw -v`{{execute}}
   
   `apt remove pw`{{execute}}
    
   `pw -v`{{execute}}

5. Run all the tests on another terminal:

   T2: `cd ~/pw/`{{execute T2}}
   
   `ls tests/`{{execute}}
   
   `tests/run.sh t01*`{{execute}}

   `tests/run.sh`{{execute}}
   
6. While the test scripts are running, check the help:

   T1: `cd ~/pw/`{{execute T1}}
   
   `sudo make install`{{execute}}

   `pw --help`{{execute}}
   
   `pw version`{{execute}}
   
   `pw help | less`{{execute}}
   
   `man pw`{{execute}}
   
   `info pw`{{execute}}
   
   
