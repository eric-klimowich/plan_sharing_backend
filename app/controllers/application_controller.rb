class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, 'my_s3cr3t_c0d3')
  end

  def decode_token(token)
    JWT.decode(token, 'my_s3cr3t_c0d3')[0]
  end
end
