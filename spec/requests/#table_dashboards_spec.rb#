require 'spec_helper'

describe "TableDashboards" do
  describe "GET /table_dashboards" do
    it "works! (now write some real specs)" do
      get table_dashboard_index_path
      response.status.should be(302)
    end
    
    it "register me" do
      visit table_dashboard_index_path

      current_path.should == new_user_session_path
      
      click_link 'Sign up'


      within(".user") do
        fill_in 'First Name', :with => 'Alexandre'
        fill_in 'Last Name', :with => 'Strzelewicz'
        fill_in 'Email', :with => 'strzelewicz.alexandre@gmail.com'
        fill_in 'Password', :with => '123456'
        fill_in 'Password Confirmation', :with => '123456'        
      end
      click_button 'submit_btn'

      click_link 'Logout'
      click_link 'Login'



      within(".user") do
        fill_in 'Email', :with => 'strzelewicz.alexandre@gmail.com'
        fill_in 'Password', :with => '123456'
      end
      click_button 'submit_btn'

      visit table_dashboard_index_path

      click_link 'create_table'

      click_link 'New Table'

      current_path.should == '/table_dashboard/1-new-table/manage'

      click_link 'access_availabilities'
      
      current_path.should == '/table_dashboard/1-new-table/manage'

      
      
      
    end

    
  end
end
