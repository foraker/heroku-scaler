module HerokuScaler
  class Config
    def initialize(settings=ENV)
      @settings=settings
    end

    def app_name
      settings["SCALE_APP_NAME"]
    end

    def big_dyno_type
      settings["SCALE_BIG_DYNO_TYPE"] || "Standard-2X"
    end

    def big_dyno_count
      settings["SCALE_BIG_DYNO_COUNT"] || 3
    end

    def small_dyno_type
      settings["SCALE_SMALL_DYNO_TYPE"] || "Standard-1X"
    end

    def small_dyno_count
      settings["SCALE_SMALL_DYNO_COUNT"] || 1
    end

    def auth_token
      settings["SCALE_OAUTH_TOKEN"]
    end

    private
    attr_reader :settings
  end
end
