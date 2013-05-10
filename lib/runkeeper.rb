module Runkeeper

  module Configuration

    def self.accept_headers
      {   :user => "application/vnd.com.runkeeper.User+json",
          :fitness_activity_feed => "application/vnd.com.runkeeper.FitnessActivityFeed+json",
          :fitness_activity => "application/vnd.com.runkeeper.FitnessActivity+json",
          :new_fitness_activity => "application/vnd.com.runkeeper.NewFitnessActivity+json",
          :strength_training_activity_feed => "application/vnd.com.runkeeper.StrengthTrainingActivityFeed+json",
          :strength_training_activity => "application/vnd.com.runkeeper.StrengthTrainingActivity+json",
          :background_activity_feed => "application/vnd.com.runkeeper.BackgroundActivityFeed+json",
          :background_activity => "application/vnd.com.runkeeper.BackgroundActivity+json",
          :sleep_feed => "application/vnd.com.runkeeper.SleepFeed+json",
          :sleep => "application/vnd.com.runkeeper.Sleep+json",
          :nutrition_feed => "application/vnd.com.runkeeper.NutritionFeed+json",
          :nutrition => "application/vnd.com.runkeeper.Nutrition+json",
          :weight_feed => "application/vnd.com.runkeeper.WeightFeed+json",
          :weight => "application/vnd.com.runkeeper.Weight+json",
          :general_measurement_feed => "application/vnd.com.runkeeper.GeneralMeasurementFeed+json",
          :general_measurement => "application/vnd.com.runkeeper.GeneralMeasurement+json",
          :diabetes_feed => "application/vnd.com.runkeeper.DiabetesFeed+json",
          :diatetes_measurement => "application/vnd.com.runkeeper.DiabetesMeasurement+json",
          :records => "application/vnd.com.runkeeper.Records+json",
          :profile => "application/vnd.com.runkeeper.Profile+json",
          :settings => "application/vnd.com.runkeeper.Settings+json"
      }.freeze
    end
  end



  module API
    extend self

    def get(path, accept_header, access_token, params = {})
      request(:get, accept_header, path, params, access_token)
    end

    def post(path, accept_header, params = {})
      request(:post, accept_header, path, params)
    end

    def put(path, accept_header, params = {})
      request(:put, accept_header, path, params)
    end

    def delete(path, accept_header, params = {})
      request(:delete, accept_header, path, params)
    end

    private

    def request(method, accept_header, path, params, access_token)
      response = connection(method).send(method) do |request|
        request.headers['Authorization'] = "Bearer #{access_token}"

        case method.to_sym
        when :get, :delete
          request.headers['Accept'] = accept_header
          request.url(path, params)
        when :put, :post
          request.headers['Content-Type'] = accept_header
          request.path = path
          request.body = params.to_json unless params.empty?
        end
      end
      response
    end

    def connection(method)
      merged_options = { :url => "https://api.runkeeper.com"}

      Faraday.new(merged_options) do |builder|
        builder.use Faraday::Request::UrlEncoded
        builder.use FaradayMiddleware::EncodeJson if method == :post
        builder.use Faraday::Response::Mashify
        builder.use Faraday::Response::ParseJson
        builder.adapter(:net_http)
      end
    end
  end

  class User
    attr_accessor :access_token, :body

    def initialize(access_token)
      binding.pry
      self.access_token = access_token
      response = API.get("user",
                         Configuration.accept_headers[:user],
                         access_token)
      self.body = response.body
    end
  end

end
