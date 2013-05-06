get '/' do
  '<h1>Hello, space. SPACECATS GO HERE. And shit.</h1>'
end

get '/:width', :provides => :jpg do
  get_kitty(params[:width], params[:width])
end

get '/:width/:height', :provides => :jpg do
  get_kitty(params[:width], params[:height])
end

def get_kitty(width, height)
  # sample picks a random array item
  image = Dir.glob("public/img/*.jpg").sample.to_s

  # ImageMagick needs integers as parameters or it craps out
  width = width.to_i
  height = height.to_i

  Magick::Image.read(image).first.resize_to_fill(width, height).to_blob
end