# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    # 1ページ目で送られてきたパラメータを@userに代入
    @user = User.new(sign_up_params)
    # 送られてきたパラメータがバリデーションに違反していないかチェック
    unless @user.valid?
      # エラーメッセージを出す
      flash.now[:alert] = @user.errors.full_messages
      # newアクションへrenderする
      render :new and return
      # 同じアクション内でrenderを2回記述する場合はand returnを使用する
    end
    # attributesで全ての属性を取得しsessionで保存
    session["devise.regist_data"] = { username: @user.attributes }
    # passwordを保存
    session["devise.regist_data"][:username]["password"] = params[:username][:password]
    # standard = @user.standard
    @standard = @user.build_standard
    render :new_standard
  end

  def create_standard
    @user = User.new(session["devise.regist_data"]["username"])
    @standard = Standard.new(standard_params)
    unless @standard.valid?
      flash.now[:alert] = @standard.errors.full_messages
      render :new_standard and return
    end
    @user.build_standard(@standard.attributes)
    if @user.save
      # sessionを削除
      session["devise.regist_data"]["username"].clear
      sign_in(:username, @user)
      flash[:notice] = "アカウント登録が完了しました"
      redirect_to root_path
    else
      flash.now[:alert] = "アカウント登録に失敗しました"
      render :new
    end
  end

  protected
    def standard_params
      params.require(:standard).permit(:weight, :calorie, :protein, :fat, :carbo, :bodyFatPercentage, :leanBodyMass, :user_id)
    end


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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
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
