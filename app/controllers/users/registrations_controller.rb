class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    binding.pry
    # 1ページ目で送られてきたパラメータを@userに代入
    @user = User.new(sign_up_params)
    @user.image = 'profile-image1.png'
    # 送られてきたパラメータがバリデーションに違反していないかチェック
    unless @user.valid?
      # エラーメッセージを出す
      flash.now[:alert] = @user.errors.full_messages
      # newアクションへrenderする
      render :new and return
      # 同じアクション内でrenderを2回記述する場合はand returnを使用する
    end
    # attributesで全ての属性を取得しsessionで保存
    session["devise.regist_data"] = {user: @user.attributes}
    # passwordを保存
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    standard = @user.standard
    @standard = @user.build_standard
    render :new_standard
    binding.pry
  end

  def create_standard
    binding.pry
    @user = User.new(session["devise.regist_data"]["user"])
    @standard = Standard.new(standard_params)
    unless @standard.valid?
      flash.now[:alert] = @standard.errors.full_messages
      render :new_standard and return
    end
    @user.build_standard(@standard.attributes)
    @user.save
    # sessionを削除
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
    # redirect_to root_path
    binding.pry
  end

  protected

  def standard_params
    params.require(:standard).permit(:weight, :calorie, :protein, :fat, :carbo, :bodyFatPercentage, :leanBodyMass, :user_id)
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end

  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
