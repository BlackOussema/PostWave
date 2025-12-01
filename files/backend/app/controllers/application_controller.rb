class ApplicationController < ActionController::API
  before_action :set_default_format

  private

  def set_default_format
    request.format = :json
  end

  def authenticate_request!
    header = request.headers['Authorization']
    header = header.split(' ').last if header.present?
    return render json: { error: 'Missing token' }, status: :unauthorized unless header

    begin
      payload = JWT.decode(header, ENV.fetch('JWT_SECRET'))[0]
      @current_user = User.find(payload['user_id'])
    rescue JWT::ExpiredSignature
      render json: { error: 'Token has expired' }, status: :unauthorized
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end

  def authorize_resource!(resource)
    unless resource.user_id == current_user&.id
      render json: { error: 'Forbidden' }, status: :forbidden
    end
  end
end