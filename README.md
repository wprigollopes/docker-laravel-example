# docker-laravel-example

Simple laravel docker example - To use as dev tool to easy the laravel run with apache.

Contributor: Moises Heberle (moiseh@gmail.com)

**How to use it:**
You'll need to create a fake ssl cert and put the files on `./` directory of this repo. The files needed are `ssl_cerver.crt` and `ssl_server.key`.

Create a default laravel install and put this files on `./docker` folder on your laravel install

Run:

`./installAndRun.sh`

Test on your browser `https://localhost:8000`
