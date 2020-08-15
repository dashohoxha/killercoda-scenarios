# Manage a Wordpress site

1. Backup `site3`:

   `ds backup`{{execute}}
   
   `ds backup site3.example.org`{{execute}}
   
   `ls -lh backup/`{{execute}}
   
2. Let's delete `site3` and then try to restore it from the backup:

   `ds site del site3.example.org`{{execute}}
   
   `ls`{{execute}}
   
   `ls apache2/sites-enabled/`{{execute}}

   Before restoring, we have to initialize it: 

   `ds site init site3.example.org`{{execute}}
   
   `ls site3.example.org/`{{execute}}
   
   `ds restore`{{execute}}
   
   `ds restore site3.example.org backup/wordpress-site3.example.org-*.tgz`{{execute}}
   
   `ls site3.example.org/`{{execute}}
   
3. Clone a site with `ds site clone`:

   `ds site clone`{{execute}}
   
   `ds site clone site3.example.org site4.example.org`{{execute}}
   
   Cloning a site to another one actually initializes the new site,
   then makes a backup on the source site and restores it on the
   target site, and finally fixes the options `siteurl` and `home` of
   the new site.
   
   Cloning a site might be useful when you want to try something new
   on the site, for example a new plugin or some configuration.
   Instead of applying it directly to the site, you may want to test
   it first on a clone.

4. Using wp-cli:

   `ds wp`{{execute}}
   
   `ds wp site3.example.org`{{execute}}
   
   `ds wp site3.example.org option`{{execute}}
   
   `ds wp site3.example.org option list`{{execute}}
   
   `ds wp site3.example.org option get siteurl`{{execute}}
   
   `ds wp site3.example.org option get home`{{execute}}

5. Working inside the container

   `ds shell`{{execute}}
   
   `ls`{{execute}}
   
   `cd site3.example.org`{{execute}}
   
   `wp`{{execute}}
   
   `wp option get siteurl`{{execute}}
   
   `wp option get home`{{execute}}
