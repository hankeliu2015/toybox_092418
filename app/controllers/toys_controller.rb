class ToysController < ApplicationController
  before_action :set_toy, only: [:show, :edit, :update, :destroy]

  def index
    @toys = Toy.all
  end

  def new
    @toy = Toy.new()
    @users = User.all
  end

  def create
    # binding.pry
    # byebug
    @toy = Toy.new(toy_params)
    if @toy.save
      redirect_to toy_path(@toy)
    else
      @users = User.all
      render :new
    end
  end

  def show
  end

  def edit
    @users = User.all
  end

  def update
    # byebug
    if @toy.update(toy_params)
      redirect_to toy_path(@toy)
    else
      @users = User.all
      render :edit 
    end
  end

  def destroy
    # byebug
    @toy.destroy
    redirect_to toys_path
  end

  private
  #strong params
  def toy_params
    params.require(:toy).permit(:name, :size, :theme, :user_id)
  end

  def set_toy
    @toy = Toy.find(params[:id])
  end
  
end
