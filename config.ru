require 'dashing'

configure do
#  set :auth_token, 'AUTH_TOKEN'
  set :default_dashboard, 'landscape' #<==== set default dashboard like this

#  helpers do
#    def protected!
#      redirect('/auth/g') unless session[:user_id]
#    end
#  end
end
map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end
set :protection, :except => :frame_options
run Sinatra::Application
