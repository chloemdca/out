class LogsController < ApplicationController
  def new
    @venue = Venue.first
    @log = Log.new
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @log = Log.new(log_params)
    # @log.user = current_user
    @log.user = User.first
    @log.venue = @venue
    if @log.save
      redirect_to venue_path(@venue)
    else
      render "venues/show", status: :unprocessable_entity
    end
  end

  def show
    @log = Log.find(params[:id])
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])
    # redirect_to root_path and return unless @log.user == current_user

    if @log.update(log_params)
      redirect_to log_path(@log)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @log = Log.find(params[:id])
    # redirect_to root_path and return unless @log.user == current_user

    @log.destroy
    redirect_to logs_path
  end

  def index
    @logs = Log.all
    # @logs = current_user.logs
  end

  private

  def log_params
    params.require(:log).permit(:rating, :comment, :date_visited)
  end
end
