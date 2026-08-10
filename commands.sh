# extract nginx config
docker run --rm nginx cat /etc/nginx/nginx.conf > nginx.conf
# run php fpm with config bind mount
docker run -v "./www.conf:/usr/local/etc/php-fpm.d/www.conf:ro" php:8.5-fpm
# create network
docker network create --driver overlay moodle-internal

# deploy stack
docker stack deploy --compose-file stack.yaml moodle

# create DB password secret
printf "Parola aici" | docker secret create postgres-superuser-password -

# inspect DB settings
docker exec -i 8d44 psql -U root -d root -c "select * from pg_settings where name like '%shared_buffers%';"

# change moodledata owner to www-data in php fpm
chown -R www-data /var/lib/moodle/moodledata/

# ssh into vps
ssh -i ./.ssh/hetzner_vps_id_rsa root@168.119.232.6

# configure git ssh key
git config core.sshCommand 'ssh -i private_key_file'
# set git origin
git remote add "origin" git@github.com:ProcopVladimirAlexandru/profesorat_deployment.git


ss -lptn 'sport = :80'

echo '--ipv4' >> ~/.curlrcdocker run -d -p 127.0.0.1:8080:8080 -e KC_PROXY_HEADERS=xforwarded -e KC_HTTP_ENABLED=true -e KC_HOSTNAME=https://invatamintulcea.ro:443/keycloak -e KC_BOOTSTRAP_ADMIN_USERNAME=admin -e KC_BOOTSTRAP_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:26.6.0 start-dev
