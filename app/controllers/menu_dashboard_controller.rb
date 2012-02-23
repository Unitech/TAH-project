class MenuDashboardController < ApplicationController
  before_filter :authenticate_user!
  # method in application_controller
  before_filter :table_belongs_to_user
  
  def index
    @menus = @table.menus
  end

  def create_new
    @table.menus.create :title => t('model.menu.init_new_menu'),
                        :description => t('model.menu.init_descr'),
                        :price => 0
    redirect_to :back, :notice => t('notifications.menu_created')
  end

  def edit
    @menu = @table.menus.find(params[:menu_id])
  end

  def delete
    menu = @table.menus.find(params[:menu_id])
    menu.delete
    redirect_to :back, :notice => t('notifications.successfully_delete')
  end

  def update
    @menu = @table.menus.find(params[:menu_id])
    if @menu.update_attributes(params[:menu])
      redirect_to table_dashboard_menu_index_path(@table, @menu)
    else
      throw 'Error unknown in update controller menu'
    end
  end
end
