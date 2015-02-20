class FacebooksController <ApplicationController

  def index
    @facebooks = Facebook.all
  end

  def new
    @facebook = Facebook.new
  end

  def create
    @facebook = Facebook.new(facebook_params)
    if @facebook.save
      redirect_to facebook_path(@facebook), notice: 'Status was successfully created!'
    else
      flash.now[:alert] = "Error creating status :("
      render :new
    end
  end

  def show
    @facebook = Facebook.find(params[:id])
  end

  def edit
    @facebook = Facebook.find(params[:id])
  end

  def update
    @facebook = Facebook.find(params[:id])
    if @facebook.update(facebook_params)

      redirect_to facebook_path(@facebook), notice: "Status was successfully updated!"
    else
      flash.now[:alert] = "Error updating status :("
      render :edit
    end
  end

  def destroy
    @facebook = Facebook.find(params[:id])
    if @facebook.destroy
      redirect_to root_path, alert: "Status was successfully destroyed!"
    end
  end


  private
  def facebook_params
    params.require(:facebook).permit(:status, :user, :likes)
  end
end
