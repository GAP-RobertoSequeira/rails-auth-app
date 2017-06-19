require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class JsonWebToken < Devise::Strategies::Authenticatable

      def store?
        false
      end

      def valid?
        request.headers['Authorization'].present?
      end

      def authenticate!
        payload = claims

        if payload && payload.has_key?('user_id')
          success! User.find_by_id(payload['user_id'])
        else
          fail!
        end
      end

      protected

      def claims
        strategy, token = request.headers['Authorization'].split(' ')
        JWTWrapper.decode(token) if strategy && strategy.downcase == 'bearer'
      rescue
        nil
      end
    end

  end
end

Warden::Strategies.add(:jwt, Devise::Strategies::JsonWebToken)
