get '/' do
  # let user create new short URL, display a list of shortened URLs
  erb :index
end


get '/:short_url' do
  @url = Url.find_by_short_url(params[:short_url])

  # binding.pry
  # @go_to_url = @url[original_url]
  Url.increment_counter(:click_count, @url.id)
  # redirect to "#{@url.original_url}"
  redirect @url.original_url
end

# get '/urls'
#   display all urls
# end

post '/urls' do
  @new_url = Url.new(original_url: params[:original_url])
  if @new_url.check_validation
    puts "invalid"
    @invalid = true
    erb :index
  else
    "valid"
    @new_url.save
    erb :display_short
  end


end



