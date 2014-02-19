get '/' do
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/urls' do
  params[:short_url] = ("a".."z").to_a.sample(4).join("")
  @new_url = Url.create(params[:url])
  # redirect to '/'
  binding.pry
  erb :display_short
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  @original_url = Url.where(short_url: params[:short_url])
  redirect to '#{@original_url.original_url}'
end
