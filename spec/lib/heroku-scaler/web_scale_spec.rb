require 'spec_helper'
require 'heroku-scaler/web_scale'

module HerokuScaler
  class TestConfig
    def app_name
      "bonanza"
    end

    def big_dyno_type
      "big-boy"
    end

    def big_dyno_count
      99
    end

    def small_dyno_type
      "small-boy"
    end

    def small_dyno_count
      9
    end

    def auth_token
      "some-token"
    end
  end

  class TestPlatformAPI
    def self.connect_oauth(token)
      TestHeroku.new
    end
  end

  class TestHeroku
    def formation
      TestFormation.new
    end
  end

  class TestFormation
    def update(app, type, hash)
    end
  end

  describe WebScale do
    let(:platform_api) { TestPlatformAPI }
    let(:scaler) { HerokuScaler::WebScale.new(TestConfig.new, platform_api) }

    describe "#up!" do
      it "calls update" do
        expect_any_instance_of(TestFormation).to receive(:update).with(
          "bonanza",
          "web",
          {
            size: "big-boy",
            quantity: 99
          }
        )
        scaler.up!
      end
    end

    describe "#down!" do
      it "calls update" do
        expect_any_instance_of(TestFormation).to receive(:update).with(
          "bonanza",
          "web",
          {
            size: "small-boy",
            quantity: 9
          }
        )
        scaler.down!
      end
    end
  end
end
