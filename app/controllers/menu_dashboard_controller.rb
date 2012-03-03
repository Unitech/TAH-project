class MenuDashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :table_belongs_to_user?
  
  def index
    @menus = @table.menus
  end

  def new
    @menu = @table.menus.new
  end

  def create
    if params[:menu].presence
      @menu = @table.menus.create params[:menu]
    else
      @menu = @table.menus.create :title => t('model.menu.init_new_menu'),
            :description => t('model.menu.init_descr')
    end
    flash[:notice] = t('notifications.menu_created')
    redirect_to :action => :edit, :menu_id => @menu.to_param
  end

  def edit
    @menu = @table.menus.find(params[:menu_id])
  end

  def destroy
    menu = @table.menus.find(params[:menu_id])
    menu.destroy
    redirect_to :back, 
                :notice => t('notifications.successfully_delete')
  end

  def update
    @menu = @table.menus.find(params[:menu_id])
    if @menu.update_attributes(params[:menu])
      redirect_to table_dashboard_menu_edit_path(@table, @menu),
                  :notice => t('notifications.menu.updated')
    else
      flash[:error] = t('notifications.fail')      
      render :action => :edit
    end
  end
end
