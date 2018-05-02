
# 1. installing pip for python[1][1]

    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py


# 2. installing pip dependancies for `htpasswd.py` 

    pip install trac

    
# 3. **creating** new password entry for nginx basic auth[2][2]

    sudo ./htpasswd.py -c -b /opt/world/access/.htpasswd <username> <password>
    sudo chown world:world /opt/world/access/.htpasswd 

# 4. **adding** new password entry for nginx basic auth[2][2]

    sudo ./htpasswd.py -b /opt/world/access/.htpasswd <username> <password>
    sudo chown world:world /opt/world/access/.htpasswd 



[1]: https://pip.pypa.io/en/stable/installing/
[2]: https://www.howtoforge.com/tutorial/basic-http-authentication-with-nginx/
