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

  image = MiniMagick::Image.open(image)

  image.filter('box').resize("#{width}x#{height}")

  send_file(image.path, :disposition => "inline")
end