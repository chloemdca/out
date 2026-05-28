class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @user = User.find(params[:user_id])
    @venue = Venue.find(params[:venue_id])
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def delete
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, notice: "List deleted successfully"
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path, notice: "List updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :comment)
  end
end
