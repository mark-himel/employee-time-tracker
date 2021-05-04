class HomeController < ApplicationController
  def index
    @clock_event = current_user.clock_event
    @clock_events = current_user.clock_events.completed
  end
end
