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

  def all_plans
    @plans = Plan.all
    render json: @plans
  end

  def create_plan
    @plan = Plan.new(content: params[:content])
    if @plan.save
      render json: @plan
    else
      nil
    end
  end

  def delete_plan
    @plan = Plan.find(params[:id])
    @plan.delete

    head :no_content
  end
  
  def update_plan
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(content: params[:content])
      render json: @plan
      #redirect_to plan_url
    else
      nil
    end
  end
end
