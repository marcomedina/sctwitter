## SCTwitter

#### Run app locally

- `bundle install`
- `rake db:create && db:migrate`
- make sure you copy `aplication.yml.dist` to `aplication.yml` for correct env variables
- `rails s`

#### Heroku deploy

- `heroku create`
- `git push origin heroku`
- `heroku run rake db:migrate`
- `figaro heroku:set -e production`

#### Run tests

- `rake test`
