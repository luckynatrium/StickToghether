class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @events_g = @user.events.confirmed.where.not creator_id: @user.id
    @events_c = Event.where creator_id: @user.id
    # TODO: add condition for confirmation
  end



  # GET /user/new
  def new
    @user = User.new
  end

  # GET /user/1/edit
  def edit

  end

  # POST /user
  # POST /user.json
  def create
    @user = User.new(user_params)
    @user.carma |= 0
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render 'devise/registrations/new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if Interest.add_interests(@user, user_params[:interest])
        format.html { redirect_to user_path(:id => @user.id), notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user][:role] = 'U'
      params.require(:user).permit(:name, :age, :role, :carma,:email,:password,:interest => [])
    end
end
