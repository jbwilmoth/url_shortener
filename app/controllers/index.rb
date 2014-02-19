get '/' do
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

# get '/:original_url' do
# end

get '/:short_url' do
  # redirect to appropriate "long" URL
  @url = Url.where(short_url: params[:short_url])
  # binding.pry
  # redirect to '@url.original_url'
end

# get '/urls'
#   display all urls
# end

post '/urls' do
  # binding.pry
  # short_url = ("a".."z").to_a.sample(4).join("")
  @new_url = Url.create(original_url: params[:original_url])
  # binding.pry
  erb :display_short
end

# e.g., /q6bda

