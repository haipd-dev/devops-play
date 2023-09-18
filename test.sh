docker run --name minu-cms-base-nginx -v /home/thien/workspace/minu-base-cms-dev/nginx/default.conf:/etc/nginx/conf.d/default.conf:ro -d --restart=unless-stopped --network=wion-dev --log-opt max-size=1G --log-opt max-file=2 -p 9100:80 nginx:stable-alpine 

docker run --name minu-cms-base-nginx -v /var/jenkins_home/workspace/green-blue/nginx-cms-base/default:/etc/nginx/conf.d/default:ro --restart=unless-stopped --network=wion-dev --log-opt max-size=1G --log-opt max-file=2 -p 9102:80 nginx:stable-alpine 


docker run --name minu-server-base-nginx -v /home/thien/workspace/minu-server-base/nginx/default.conf:/etc/nginx/conf.d/default.conf:ro -d --restart=unless-stopped --network=wion-dev --log-opt max-size=1G --log-opt max-file=2 -p 9001:80 -p 9006:81 nginx:stable-alpine 
