class PinsController < ApplicationController
  before_action :find_pin, only: [:destroy, :show,:edit,:update, :upvote]
  before_action :authenticate_user!, except: [  :index, :show, :upvote]
  def index
    @pin = Pin.all
  end
def show

end

  def new
    @pin = current_user.pins.build
  end

  def create

    @user = current_user
    @pin = @user.pins.new(pin_params)

    if @pin.save
      redirect_to root_path , notice: "successfully created new pin"
    else render 'new'
    end
  end


  def edit

  end

  def update

    if @pin.update(pin_params)
      redirect_to root_path
    end
  end

  def destroy

    if @pin.destroy
      redirect_to root_path , notice: " pin is successfully deleted "
    end
  end

  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end

  private

  def find_pin
    @pin = Pin.find(params[:id])
  end


 def pin_params
   params.require(:pin).permit( :title , :description, :user_id, :image)
 end



end
