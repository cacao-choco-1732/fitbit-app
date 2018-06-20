# README

[fitbit WebAPI](https://dev.fitbit.com/build/reference/web-api/)と連携し、データ蓄積と参照を目的とするアプリケーションです。

## Versions

- `Ruby 2.4.2`
- `MySQL 5.7`

## Installation

    $ git clone git@github.com:cacao-choco-1732/fitbit-app.git
    $ cd fitbit-app
    $ bundle install --path vendor/bundle

    # Env settings
    $ cp .env-sample .env
    $ vi .env             # set your mysql user and password

    # Database creation
    $ bundle exec rake db:create

    # Database initialization
    $ bundle exec rake db:migrate

## Run the test suite

* ...

## Deployment instructions

* ...
