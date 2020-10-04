class RegistrationsController < DeviseTokenAuth::RegistrationsController

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  private
    def sign_up_params
      params.permit(:name, :email, :password, :password_confirmation, :note, :birthday)
    end
end
