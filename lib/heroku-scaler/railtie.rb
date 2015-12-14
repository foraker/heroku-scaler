module HerokuScaler
  class Railtie < Rails::Railtie
    rake_tasks do
      load File.expand_path('../../tasks/heroku_scale.rake', __FILE__)
    end
  end
end
