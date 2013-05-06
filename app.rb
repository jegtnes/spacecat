require 'pp'
get '/' do
  '<h1>Hello, space. SPACECATS GO HERE. And shit.</h1>'
end

get '/image', :provides => :jpg do
  # sample picks a random array item
  file = Dir.glob("public/img/*.jpg").sample.to_s
  source = Magick::Image.read(file).first.resize_to_fill(70, 70).to_blob
  source
end

# # Square image
# get '/:length' do
#   "You want a #{params[:length]}x#{params[:length]} placeholder image. Woo!"
# end

# # Image, no filters
# get '/:width/:height' do
#   "You want a #{params[:width]}x#{params[:height]} placeholder image. Woo!"
# end

# # Image, filters
# get '/:width/:height/:filter' do
#   "You want a #{params[:width]}x#{params[:height]} placeholder image, with a <strong>#{params[:filter]} filter. Woo!"
# end