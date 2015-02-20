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
      flash[:notice] = "Post successfully created"
      redirect_to facebook_path(@facebook)

    else
      flash.now[:alert] = "Error creating status"
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
      flash[:notice] = "Status was successfully updated!"
      redirect_to facebook_path(@facebook)
    else
      flash[:alert] = "Error updating status :("
      render :edit
    end
  end

  def destroy
    @facebook = Facebook.find(params[:id])
    if @facebook.destroy
      flash[:alert] = "Status was successfully destroyed!"
      redirect_to root_path
    end
  end

  def like
    facebook = Facebook.find(params[:facebook])
    if facebook.likes != nil
      facebook.likes = facebook.likes + 1
      facebook.save
      redirect_to root_path

    else
      facebook.likes = 1
      facebook.save

    redirect_to root_path
    end
  end

  private
  def facebook_params
    params.require(:facebook).permit(:status, :user, :likes)
  end
end
