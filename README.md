# TAH-project

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
