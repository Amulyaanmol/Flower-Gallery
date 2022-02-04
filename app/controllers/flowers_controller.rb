class FlowersController < ApplicationController
  def index
    @flowers = Flower.all
  end

  def show
    @flower = Flower.find(params[:id])
  end

  def new
    @flower = Flower.new
  end

  def create
    @flower = Flower.new(params.require(:flower).permit(:name, :price))
    if @flower.save
      flash[:notice] = 'Flower Added'
      redirect_to @flower
    else
      render :new
    end
  end

  def edit
    @flower = Flower.find(params[:id])
  end

  def update
    @flower = Flower.find(params[:id])
    if @flower.update(params.require(:flower).permit(:name, :price))
      flash[:notice] = 'Flower Updated'
      redirect_to @flower
    else
      render :edit
    end
  end

  def destroy
    @flower = Flower.find(params[:id])
    @flower.destroy
    redirect_to flowers_path
  end
end
