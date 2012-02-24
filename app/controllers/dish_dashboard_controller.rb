class DishDashboardController < ApplicationController
  before_filter :authenticate_user!
  # method in application_controller
  before_filter :table_belongs_to_user

  def index
  end

  def edit
  end

  def update
  end

  def create
    @table.menus.find(params[:menu_id]).dishes.create(params[:dish])
    redirect_to :back, :notice => t('notifications.menu_created')
  end

  def delete
  end
end
