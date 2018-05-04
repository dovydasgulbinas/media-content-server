
uname='world'
cname='nginx'

domains=$(cat "my-domains.txt")
certdir='/etc/letsencrypt/live/namas.duckdns.org'
nginx_certdir='/opt/world/nginx-config/keys'
mode='renew'

sudo docker stop $cname
sudo certbot $mode -n --standalone $domains
sudo cp "$certdir/fullchain.pem" $nginx_certdir
sudo cp "$certdir/privkey.pem" $nginx_certdir
sudo chown $uname:$uname "$nginx_certdir/*"
sudo chmod 600 "$nginx_certdir/privkey.pem"
sudo docker start $cname

