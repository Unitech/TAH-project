class DishDashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :table_belongs_to_user?

  def index
  end

  def edit
    @dish = @table
      .menus
      .find(params[:menu_id])
      .dishes
      .find(params[:dish_id])    
  end

  def update
    @dish = @table
      .menus
      .find(params[:menu_id])
      .dishes
      .find(params[:dish_id])    

    if @dish.update_attributes(params[:dish])
      redirect_to table_dashboard_menu_edit_path, 
                  :notice => t('notifications.menu.updated')
    else
      flash[:error] = t('notifications.fail')      
      render :action => :edit
    end
  end

  def create
    if !request.xhr?
      throw "(TODO) not an xhr request"
    end

    @dish_sample = DishSample
      .where(:title => params[:dish][:title])
      .first

    @dish = @table
      .menus
      .find(params[:menu_id])
      .dishes
      .new(params[:dish])

    #
    # Dup image with dish samples if title is the same
    #
    if !@dish_sample.nil?
      @dish.image = @dish_sample.image
    end
        
    if @dish.save
      dish_el = render_to_string(partial: 'dish_dashboard/dish_list_element', 
                                 locals: { :dish => @dish })
      render :json => { 
        :status => :created,
        :partial => dish_el.to_s
      }
    else
      render :json => @dish.errors,         
             :status => :not_acceptable
    end
  end

  def destroy
    @dish = @table
      .menus
      .find(params[:menu_id])
      .dishes
      .find(params[:dish_id])
    @dish.destroy
    
    redirect_to table_dashboard_menu_edit_path, 
                  :notice => t('notifications.dish.deleted')    
  end

end
