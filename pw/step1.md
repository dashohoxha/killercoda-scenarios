# Installation

1. Make sure that the dependencies are installed:

   ```
   apt install --yes \
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

2. Get the code of `pw` and install:

   `git clone https://gitlab.com/dashohoxha/pw`{{execute}}
   
   `cd pw/`{{execute}}
   
   `sudo make install`{{execute}}
   
   `pw`{{execute}}
   
   `pw version`{{execute}}
   
   `pw --help`{{execute}}
   
3. Run all the tests:

   `tests/run.sh`{{execute}}
