# README

This README would normally document whatever steps are necessary to get the
application up and running.

Install ruby 3.2.2

Install rails 7.0.6

Install postresql 

sudo service postgresql start
sudo -u postgres psql
CREATE ROLE postgres WITH SUPERUSER CREATEDB CREATEROLE LOGIN;
ALTER USER postgres WITH PASSWORD 'PASSWORD';
CREATE ROLE rails LOGIN PASSWORD 'rails';
ALTER ROLE rails CREATEDB;

Install Redis server
sudo apt install redis-server
redis-server

git clone https://github.com/Tas-depal/Clone-Mattermost.git
cd Clone-Mattermost
bundle i
rails db:create
rails db:migrate
