class LogsController < ApplicationController
  def new
    @log = Log.new
    @venues = Venue.all
  end

  def create
    @log = Log.new(log_params)
    @log.user = User.first
    if @log.save
      redirect_to logs_path, notice: "Log successfully created"
    else
      @venue = Venue.find(log_params[:venue_id]) if log_params[:venue_id].present?
      @venues = Venue.all
      render "logs/new", status: :unprocessable_entity
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
      redirect_to log_path(@log), notice: "List updated successfully"
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
    params.require(:log).permit(:rating, :venue_id, :comment, :date_visited)
  end
end
