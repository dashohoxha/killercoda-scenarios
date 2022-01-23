# Networking

1. Basic tools:

   `ip address`{{execute}}
   
   `ip addr`{{execute}}
   
   `ip a`{{execute}}
   
   `ip addr show lo`{{execute}}
   
   `ip route`{{execute}}
   
   `ip r`{{execute}}
   
   `ping 8.8.8.8`{{execute}}
   
   `dig linuxcommand.org`{{execute}}
   
   `dig linuxcommand.org +short`{{execute}}
   
   `ping linuxcommand.org`{{execute}}
   
   `traceroute linuxcommand.org`{{execute}}
   
   `tracepath linuxcommand.org`{{execute}}
   
2. For downloading files we can use `wget` or `curl`:

   `wget http://linuxcommand.org/index.php`{{execute}}
   
   `less index.php`{{execute}}
   
   `wget -O index.html 'http://linuxcommand.org/index.php'`{{execute}}
   
   `less index.html`{{execute}}
   
   `curl http://linuxcommand.org/index.php`{{execute}}
   
   `curl http://linuxcommand.org/index.php > index.html`{{execute}}

3. Netcat is a simple tool for network communication.

   Let's use it listen to the port `12345`:
   
   `nc -l 12345`{{execute}}
   
   Open another terminal: `pwd`{{execute T2}}
   In the second terminal connect to the same port like this:
   
   `nc localhost 12345`{{execute}}
   
   Now, any line that you type here is sent and displayed to the other
   terminal:
   
   `Hello network`{{execute}}
   
   `The quick brown fox jumped over the internet`{{execute}}
   
   Check the other terminal: `pwd`{{execute T1}}
   
   This may not seem very impressive, but instead of `localhost` we
   could have used a real server name or IP and connect to it
   remotely. It may be used to check that the TCP port `12345` on the
   server is accessible from the client (in case that there is a
   firewall, for example).
   
   For checking a UDP port we can add the option `-u` to both of these
   commands.

   It can also be used as a simple tool for file transfer:
   
   `nc -l 12345 > file.txt`{{execute T1}}
   
   `cd`{{execute T2}}
   
   `nc -w 3 localhost 12345 < /etc/passwd`{{execute}}
   
   `ls`{{execute T1}}
   
   `cat file.txt`{{execute}}
   
   As another example, let's combine it with `tar` to transfer a whole
   directory:
   
   `mkdir cptest`{{execute}}
   
   `cd cptest`{{execute}}
   
   `nc -l 12345 | tar xzpf -`{{execute}}
   
   `ls`{{execute T2}}
   
   `cd testdir`{{execute}}
   
   `tar czpf - . | nc localhost 12345`{{execute}}
   
   `ls`{{execute T2}}
   
   `cd ..`{{execute}}
   
   `ls`{{execute T1}}
   
   `cd ..`{{execute}}

4. 
