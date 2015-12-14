require 'heroku-scaler/config'
require 'platform-api'

module HerokuScaler
  class WebScale
    extend Forwardable

    def initialize(config=Config.new, platform_api=PlatformAPI)
      @config = config
      @platform_api = platform_api
    end

    def up!
      web_scale(big_dyno_type, big_dyno_count)
    end

    def up_if_weekday!
      up! if weekday?
    end

    def down!
      web_scale(small_dyno_type, small_dyno_count)
    end

    private

    attr_reader :config, :platform_api

    def weekday?
      (1..5).include?(Date.today.cwday)
    end

    def_delegators :config,
      :app_name,
      :big_dyno_type,
      :big_dyno_count,
      :small_dyno_type,
      :small_dyno_count,
      :auth_token

    def web_scale(dyno_type, dyno_count)
      heroku.formation.update(app_name, 'web', {
        size: dyno_type,
        quantity: dyno_count
      })
    end

    def heroku
      @heroku ||= platform_api.connect_oauth(auth_token)
    end
  end
end
