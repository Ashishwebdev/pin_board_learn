class PinsController < ApplicationController
  def index
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      redirect_to root_path
    end
  end


  def edit
  @pin = Pin.find(parms[:id])
  end

  def update
   @pin = Pin.find(pin_params)
    if @pin.update(pin_params)
      redirect_to root_path
    end
  end

  private

 def pin_params
   params.require(:pin).permit(:title, :description)
 end


end
