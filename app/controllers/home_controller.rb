class HomeController < ApplicationController
  def index
    @tables = Table.all
  end
end
