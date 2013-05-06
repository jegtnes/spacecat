get '/' do
  '<h1>Hello, space. SPACECATS GO HERE. And shit.</h1>'
end

get '/:width', :provides => :jpg do
  # sample picks a random array item
  file = Dir.glob("public/img/*.jpg").sample.to_s

  # ImageMagick needs integers as parameters or it craps out
  width = params[:width].to_i
  source = Magick::Image.read(file).first.resize_to_fill(width, width).to_blob
  source
end

get '/:width/:height', :provides => :jpg do
  # sample picks a random array item
  file = Dir.glob("public/img/*.jpg").sample.to_s

  width = params[:width].to_i
  height = params[:height].to_i
  source = Magick::Image.read(file).first.resize_to_fill(width, height).to_blob
  source
end