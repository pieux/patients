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
  end

  def create_plan
    @plan = Plan.new(content: params[:content])
    if @plan.save
      render json: @plan
    else
      nil
    end
  end
end
