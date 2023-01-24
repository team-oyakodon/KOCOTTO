class TopController < ApplicationController
  before_action :set_query, only: [:index, :search]
  skip_before_action :require_login

  def index
    @supports = Support.all
  end

  def search
    @results = @query.result
  end

  def show
    @support = Support.find(params[:id])
  end

  private
  def set_query
    @query = ConditionsSupport.ransack(params[:query])
  end
end
