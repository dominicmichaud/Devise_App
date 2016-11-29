class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  def create
    @resource = User.find_for_database_authentication(email: params[:user][:email])
    return invalid_login_attempt unless @resource

    if @resource.valid_password?(params[:user][:password])
      sign_in :user, @resource
      #add successful login flash message
      redirect_to :back, flash: {notice: "Login successful!"}
    else
      invalid_password
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    super
    #add successful logout flash message
    flash[:notice] = "Logout successful!"
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def invalid_login_attempt
    set_flash_message(:alert, :invalid)

    respond_to do |format|
      format.js
    end
  end

  def invalid_password
    set_flash_message(:alert, :invalid_password)

    respond_to do |format|
      format.js
    end
  end
end
