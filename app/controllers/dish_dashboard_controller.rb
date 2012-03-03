class DishDashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :table_belongs_to_user?

  def index
  end

  def edit
  end

  def update
  end

  def create
    if !request.xhr?
      throw "(TODO) not an xhr request"
    end

    @dish = @table.menus.find(params[:menu_id]).dishes.new(params[:dish])
        
    if @dish.save

      dish_el = render_to_string(partial: 'dish_dashboard/dish_list_element', 
                                 locals: { :dish => @dish, :table => @table, :menu => Menu.find(params[:menu_id]) })

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
  end
end
