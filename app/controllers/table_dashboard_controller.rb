class TableDashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :table_belongs_to_user?, :except => [:index, :create_new]

  def index
    @tables = current_user.tables
    #throw "#{params[:controller]}"
    #throw "#{controller_name} #{action_name}"
  end

  def create_new
    if params[:table].presence
      @new_table = current_user.tables.new(params[:table])
    else
      # Create default table  
      @new_table = current_user.tables.new :title => t('model.table.init_new_table'), :description => t('model.table.init_descr')
    end      
    
    if @new_table.save
      redirect_to :back, :notice => t('notifications.table_created')
    else
      redirect_to :back, :notice => t('notifications.fail')
    end
  end

  def manage
    @menus = @table.menus
  end

  def edit_table
  end

  def update_table
    if @table.update_attributes(params[:table])
      redirect_to table_dashboard_manage_path(@table)
    else
      flash[:error] = t('notifications.fail')
      render :edit_table
    end
  end

  def edit_availabilities
    @interval = Array.new

    @menus = @table.menus.includes(:availabilities)

    @menus.each do |menu|
      menu.availabilities.each do |available|
        available.title = menu.title
        @interval << available.for_calendar
      end
    end
    
  end

end
