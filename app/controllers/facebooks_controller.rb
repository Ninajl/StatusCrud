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
      redirect_to facebook_path(@facebook)
    else
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
      redirect_to facebook_path(@facebook)
    else
      render :edit
    end
  end

  def destroy
    @facebook = Facebook.find(params[:id])
    if @facebook.destroy
      redirect_to facebook_path(@facebook)
    end
  end


  private
  def facebook_params
    params.require(:facebook).permit(:status, :user, :likes)
  end
end
