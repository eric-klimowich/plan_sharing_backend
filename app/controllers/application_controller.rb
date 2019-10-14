class ApplicationController < ActionController::API
  # before_action :authorized

  def secret_key
    ENV['SECRET_KEY']
  end

  def payload
    {
      sub: @user.id,
      iat: Time.now.to_i,
      exp: Time.now.to_i + 7200000
    }
  end

  def encode_token(payload)
    JWT.encode(payload, secret_key(), "HS256")
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header()
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, secret_key(), true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def authenticate
    if(!decoded_token())
      render json: {
        message: 'Authorization failed.'
      }, status: :unauthorized
    end
  end

  def requires_user
    @user = User.find(params[:id])
    if decoded_token[0]['sub'] != @user.id
      render json: {
        message: 'Authorization failed.'
      }, status: :unauthorized
    end
  end

  def get_token_payload(key)
    begin
      decoded_token[0][key]
    rescue NoMethodError
      nil
    end
  end

  def logged_in_user_id
    @user = User.find_by(id: get_token_payload('sub'))
    return @user.id
  end
  # def current_user
  #   if decoded_token()
  #     user_id = decoded_token[0]['sub']
  #     @user = User.find_by(id: user_id)
  #   end
  # end
  #
  # def logged_in?
  #   !!current_user()
  # end
  #
  # def authorized
  #   render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?()
  # end
end
