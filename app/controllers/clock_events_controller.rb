class ClockEventsController < ApplicationController
  before_action :set_clock_event

  def edit
  end

  def update
    if @clock_event.update(clock_event_params)
      redirect_to root_path, notice: 'Updated Successfully!'
    else
      render :edit
    end
  end

  private

  def set_clock_event
    @clock_event = ClockEvent.find(params[:id])
  end

  def clock_event_params
    params.require(:clock_event).permit(:check_in, :check_out, :user_id)
  end
end
