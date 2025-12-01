module Api
  module Auth
    class AuthController < ApplicationController
      skip_before_action :authenticate_request!, only: [:register, :login]

      def register
        user = User.new(register_params)
        if user.save
          token = generate_token(user.id)
          render json: { token: token, user: user.as_json(only: %i[id email name]) }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def login
        user = User.find_by(email: params[:email]&.downcase)
        if user&.authenticate(params[:password])
          token = generate_token(user.id)
          render json: { token: token, user: user.as_json(only: %i[id email name]) }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      private

      def register_params
        params.permit(:name, :email, :password, :password_confirmation)
      end

      def generate_token(user_id)
        payload = { user_id: user_id, exp: 24.hours.from_now.to_i }
        JWT.encode(payload, ENV.fetch('JWT_SECRET'))
      end
    end
  end
end