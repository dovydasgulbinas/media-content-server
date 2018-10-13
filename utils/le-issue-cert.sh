
uname='world'
cname='nginx'

domains=$(cat "my-domains.txt" | xargs)
certdir='/etc/letsencrypt/live/namas.duckdns.org'
nginx_certdir='/opt/world/nginx-config/keys'



# sudo docker stop $cname
# call live bellow on first run
#sudo certbot $mode -n --standalone $domains
sudo certbot certonly --standalone $domains
# sudo cp "$certdir/fullchain.pem" $nginx_certdir
# sudo cp "$certdir/privkey.pem" $nginx_certdir
# sudo chown -R $uname:$uname "$nginx_certdir"
# sudo chmod 600 "$nginx_certdir/privkey.pem"
# sudo docker start $cname

