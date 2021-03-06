class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  def show
    @User = User.find(params[:id])
    @posts = @User.posts.paginate(page: params[:page]).order(created_at: :desc)
  end

  def custom
    @User = User.where({first_name: params[:first_name].capitalize, last_name: params[:last_name].capitalize})[0]
    @posts = Post.where(user_id: @User.id)
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  def following
    @following = @User.following
  end

  def followers
    @followers = @User.followers
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    params.require(:user).permit(:email, :encrypted_password, :image, :first_name, :last_name)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    params.require(:user).permit(:email, :encrypted_password, :image, :first_name, :last_name, :password_confirmation, :current_password)
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
