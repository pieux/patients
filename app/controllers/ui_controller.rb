class UiController < ApplicationController
  def index
  end

  def about
  end

  def signup
  end

  def login
  end

  def plan
    @plan = Plan.new(params[:content])
  end

  def create_plan
    @plans = Plan.all
    render :json => @plans
  end
end
