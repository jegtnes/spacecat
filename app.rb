get '/' do
  erb :index
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

  image = Magick::Image.read(image).first
  blob = image.resize_to_fill(width, height).to_blob
  image.destroy!
  blob
end