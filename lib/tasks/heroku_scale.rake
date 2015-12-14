require 'heroku-scaler/web_scale'

namespace :heroku_scale do
  namespace :web do
    desc "Scale heroku web dynos up if it is a weekday"
    task :up_if_weekday do
      HerokuScaler::WebScale.new.up_if_weekday!
    end

    desc "Scale heroku web dynos up"
    task :up do
      HerokuScaler::WebScale.new.up!
    end

    desc "Scale heroku web dynos down"
    task :down do
      HerokuScaler::WebScale.new.down!
    end
  end
end
