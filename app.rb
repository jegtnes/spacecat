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

  dimensions = width + "x" + height
  # sample picks a random array item
  random_image = Dir.glob("public/img/*.jpg").sample.to_s

  image = MiniMagick::Image.open(random_image)

  image.combine_options do
    image.filter('box') # improves performance for a very slight quality tradeoff
    image.resize(dimensions + "^^") # ^^ makes the image fill up the larger version of the crop
    image.extent(dimensions) # crops stuff
  end

  send_file(image.path, :disposition => "inline")
end