class PinsController < ApplicationController
  before_action :find_pin, only: [:show,:edit,:update,:destroy]



  def index
    @pin = Pin.all
  end
def show

end
  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
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

  private

  def find_pin
    @pin = Pin.find(params[:id])
  end

 def pin_params
   params.require(:pin).permit(:title, :description)
 end


end
