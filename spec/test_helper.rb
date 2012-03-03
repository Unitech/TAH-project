
def transcendant_factory
  @user = Factory(:user)
  @table = Factory(:table, :user => @user)
  @menu = Factory(:menu, :table => @table)
  @dish = Factory(:dish, :menu => @menu)
end

def pre_menu_factory
  @user = Factory(:user)
  @table = Factory(:table, :user => @user)
end
