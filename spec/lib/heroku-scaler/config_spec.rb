require 'spec_helper'
require 'heroku-scaler/config'

module HerokuScaler
  describe Config do
    let(:config) { HerokuScaler::Config.new({}) }

    describe "#big_dyno_type" do
      it "has a default" do
        expect(config.big_dyno_type).to eq("Standard-2X")
      end
    end

    describe "#big_dyno_count" do
      it "has a default" do
        expect(config.big_dyno_count).to eq(3)
      end
    end

    describe "#small_dyno_type" do
      it "has a default" do
        expect(config.small_dyno_type).to eq("Standard-1X")
      end
    end

    describe "#small_dyno_count" do
      it "has a default" do
        expect(config.small_dyno_count).to eq(1)
      end
    end
  end
end
