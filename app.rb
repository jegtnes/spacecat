require 'sinatra'

get '/' do
  '<h1>Hello, space. SPACECATS GO HERE. And shit.</h1>'
end 


# dimensions
get '/*/*' do
  "<h1>You want a placeholder image. Woo!</h1><pre>#{params[:splat].inspect}</pre>"
end