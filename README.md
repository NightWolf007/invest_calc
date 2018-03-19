# README

## Deployment
### Docker
```bash
docker-compose pull
docker-compose build
docker-compose up -d db
docker-compose run app rake db:create db:migrate db:seed
docker-compose up app
```

### Without Docker
```bash
gem install bundler
bundle install
bundle exec rake db:create db:migrate db:seed
bundle exec rails s
```
