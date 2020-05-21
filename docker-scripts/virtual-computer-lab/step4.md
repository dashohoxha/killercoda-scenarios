# Testing

1. First let's create a guacamole user and grant him access to the
   server `linuxmint-1`:
   
   `cd /var/ds/guacamole/`{{execute}}

   `ds guac`{{execute}}

   `ds guac server add linuxmint-1`{{execute}}

   `ds guac server ls`{{execute}}

   `ds guac user add student pass123`{{execute}}

   `ds guac user ls`{{execute}}

   `ds guac user connect student linuxmint-1`{{execute}}

   `ds guac user ls student`{{execute}}
   
   Instead of `student` and `pass123` you can use whatever else you
   like, however `linuxmint-1` is the name of the linuxmint container:
   
   `grep CONTAINER /var/ds/linuxmint/settings.sh`{{execute}}

2. Now go to the tab of guacamole, logout from user admin, and login
   as the new user:

   https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com/

   Test the terminal and the desktop connection to `linuxmint-1`.  You
   can use any of the users on `accounts.txt` or the user `admin` that
   is defined on `settings.sh`:
   
   `head -20 settings.sh`{{execute}}
   
   **Note:** To logout from guacamole while you are at the desktop,
   first press `Ctrl+Alt+Shift`, and then select `Logout` from the
   user menu.

3. Try to open Epoptes from users other than admin (user1, user2,
   etc.)  and then try it as the user `admin`. For an example see this
   short demo: https://www.youtube.com/watch?v=Q0r_RTMjePI
   
   While being logged-in as admin on linuxmint, open a terminal and
   try to install any new packages with `sudo`, for example:
   
   `sudo apt install frozen-bubble`
   
   Also try to make a backup of the user accounts:
   
   `sudo users.sh backup`

4. Users of the linuxmint container can also be managed from the host
   system:

   `cd /var/ds/linuxmint/`{{execute}}
   
   `ds users create accounts.txt`{{execute}}
   
   `ds users backup`{{execute}}
   
   `ds users restore backup/users-*.tgz`{{execute}}
   
5. To allow another user permission to open Epoptes:
   
   `ds exec adduser user1 epoptes`{{execute}}
   
6. To install another package:
   
   `ds exec apt install frozen-bubble`{{execute}}
   
   Or like this:
   
   `ds shell`{{execute}}
   
   `apt install frozen-bubble`{{execute}}
   
   `exit`{{execute}}
   
7. To create another admin user:
   
   `ds inject add-admin.sh admin1 pass1`{{execute}}
   
   (This is an admin on linuxmint, not on guacamole.)
