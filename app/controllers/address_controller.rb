class AddressController < ApplicationController
  before_filter :authenticate_user!
  before_filter :table_belongs_to_user?

  def create
    @address = Address.create(address1: params[:address1],
                              address2: params[:address2],
                              city: params[:city],
                              region: params[:region],
                              zipcode: params[:zipcode],
                              country: params[:country],
                              latitude: params[:latitude],
                              longitude: params[:longitude],
                              code: params[:code],
                              code2: params[:code2],
                              table_id: @table.id)
    
    if @address
      render :json => { 
        :success => true, 
        :new_id => @address.id 
      }
    else
      render :json => @address.errors,         
             :status => :not_acceptable
    end    
  end


  def update
    @address = @table.address    
    @address.update_attributes(address1: params[:address1],
                               address2: params[:address2],
                               city: params[:city],
                               region: params[:region],
                               zipcode: params[:zipcode],
                               country: params[:country],
                               latitude: params[:latitude],
                               longitude: params[:longitude],
                               code: params[:code],
                               code2: params[:code2])
    
    if @address
      render :json => { 
        :success => true, 
        :new_id => @address.id 
      }
    else
      render :json => @address.errors,         
             :status => :not_acceptable
    end    
  end

end
