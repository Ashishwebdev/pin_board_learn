class PinsController < ApplicationController
  def index
    @pin = Pin.all
  end
def show
@pin = Pin.find(params[:id])
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
  @pin = Pin.find(params[:id])
  end

  def update
   @pin = Pin.find(params[:id])
    if @pin.update(pin_params)
      redirect_to root_path
    end
  end

  def destroy
    @pin = Pin.find(params[:id])
    if @pin.destroy
      redirect_to root_path , notice: " pin is successfully deleted "
    end
  end

  private

 def pin_params
   params.require(:pin).permit(:title, :description)
 end


end
