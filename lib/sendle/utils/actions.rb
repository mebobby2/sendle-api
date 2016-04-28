module Sendle
  module Api
    module Utils
      class Actions

        def self.check_for_missing_credentials
          raise Sendle::Api::Errors::MissingSendleId if Sendle::Api.sendle_id.nil?
          raise Sendle::Api::Errors::MissingApiKey if Sendle::Api.api_key.nil?
        end

      end
    end
  end

end