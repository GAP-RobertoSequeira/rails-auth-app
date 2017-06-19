class JWTWrapper

  def self.encode(payload, expiration = nil)
    expiration ||= Rails.application.secrets.jwt_expiration_hours

    payload = payload.dup
    payload['exp'] = expiration.to_i.hours.from_now.to_i

    JWT.encode(payload, Rails.application.secrets.jwt_secret, 'HS256')
  end

  def self.decode(token)
    begin
      decoded_token = JWT.decode(token, Rails.application.secrets.jwt_secret, true, {:algorithm => 'HS256'})

      decoded_token.first
    rescue
      nil
    end
  end
end
