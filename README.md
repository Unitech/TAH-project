# TAH-project

# TODO

- AJAX

## Notes for designing

### Layout

The default layout is used in :
    app/views/layout/application.html.erb
    
### Stylesheets

Stylesheet location :
    app/assets/stylesheets
    
### Bootstrap

Bootstrap :
    vendor/assets/stylesheets/
    

## Notes for deployment

### Sitemap

In public/robots.txt change the url
    Sitemap: http://yourdomain.com/sitemap.xml
    
Modify config/initializers/sitemap.rb :
    https://github.com/lassebunk/dynamic_sitemaps
    
### Capistrano

Update the file :
    config/deploy.rb
    
Deploy :
    cap deploy
        
### Devise

Change sender email in config/initilizers/devise.rb :
    config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

### Google Analytics

Modify the UA-code in :
    app/views/layouts/javascript

### Calendar to edit availabilities

In 
    config/application.rb
Check
    config.time_zone = 'CET'
    
In the view we Use Date.js, which the date is adapted to the UTC,GMT of the client browser
Warning ;)

## Test Unit

Spork + Guard + Rspec + Factory Girl

### Run

    rake db:test:prepare
    bundle exec guard
    
