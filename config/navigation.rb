# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  # navigation.selected_class = 'your_selected_class'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation



  navigation.items do |primary|
    navigation.selected_class = 'active'
    primary.dom_class = 'nav'

    primary.item :home, t('navigation.home'), root_path
    primary.item :table_dashboard, t('navigation.table_dashboard'), table_dashboard_index_path
    
    primary.item :logout, t('navigation.logout'), destroy_user_session_path, :method => :delete, :if => Proc.new { user_signed_in? }
    primary.item :login, t('navigation.login'), user_session_path, :if => Proc.new { !user_signed_in? }    
    primary.item :register, t('navigation.register'), new_user_registration_path, :if => Proc.new { !user_signed_in? }
  end
  
  #primary.item :contact, t('Contact'),

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    # primary.dom_class = 'menu-class'

    # You can turn off auto highlighting for a specific level

    # primary.auto_highlight = false

    #     primary.item :key_2, 'Projets en cours', list_projects_path do |f| 
    #   f.dom_class = 'subnav'
    #   f.item :discover_company, 'Les entreprises', list_projects_path(:type => 'entreprise') do |t|
    #     t.dom_class = 'subsubnav'
    #     t.item :recent, 'Bientôt terminé', list_projects_path(:sort => 'finishing', :type => 'entreprise')
    #     t.item :recent, 'Les plus récents', list_projects_path(:sort => 'recent', :type => 'entreprise')
    #   end

    #   f.item :discover_project, 'Les projets', list_projects_path(:type => 'projets') do |t| 
    #     t.dom_class = 'subsubnav'
    #     t.item :recent, 'Bientôt terminé', list_projects_path(:sort => 'finishing', :type => 'project')
    #     t.item :recent, 'Les plus récents', list_projects_path(:sort => 'recent', :type => 'project')
    #   end


   
    #   f.item :recent, 'Projets terminés', list_projects_path + '?sort=finished'
    #   # f.item :sort, 'Bientôt terminé', list_projects_path + '?sort=finishing'
    #   # f.item :sort, 'Les plus récents', list_projects_path + '?sort=recent'
    # end
  
end
