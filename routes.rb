get '/' do
  if no_authentication?
    erb :"index"
  else
    erb :"index"
  end
end


get '/activities' do
  if no_authentication?
    erb :"activities"
  else
    erb :"activities"
  end
end