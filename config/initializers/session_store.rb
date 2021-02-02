if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_subtracked', domain: 'subtracked'
else
    Rails.application.config.session_store :cookie_store, key: '_subtracked'
end