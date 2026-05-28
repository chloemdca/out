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
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to @list, notice: "List saved"
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
