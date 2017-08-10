get '/activities' do
  @activities = Activity.all
  erb :"activity/activities"
end

get '/activities/new' do
    erb :"activity/new"
end

post '/activities' do
  new_act = Activity.new
  new_act.location = params[:location]
  new_act.supervisor = params[:supervisor]
  new_act.sup_email = params[:sup_email]
  new_act.description = params[:description]
  new_act.hours = params[:hours]
  new_act.save
  redirect "/activities"
end

get '/activities/:id' do
  id = params[:id].to_i
  @activity = Activity.find(id)
  erb :"activity/show"
end

get '/activities/:id/edit' do #load edit form
    id = params[:id].to_i
    @activity = Activity.find(id)
    erb :"/activity/edit"
end

patch '/activities/:id' do #edit action
  id = params[:id].to_i
  @activity = Activity.find(id)
  @activity.location = params[:location]
  # @activity.date = params[:date]
  @activity.supervisor = params[:supervisor]
  @activity.sup_email = params[:sup_email]
  @activity.hours = params[:hours]
  @activity.description = params[:description]
  @activity.save
  redirect "/activities"
end

get '/activities/:id/delete' do #load edit form
    id = params[:id].to_i
    @activity = Activity.find(id)
    erb :"/activity/delete"
end

delete '/activities' do #delete action
  id = params[:id].to_i
  @activity = Activity.find(id)
  @activity.delete
  redirect '/activities'
end



get '/admin/new' do
  if no_authentication?
    erb :"admin/new"
  else
    erb :"admin/new"
  end
end

get '/admin' do
  @admins = Admin.all
  erb :"admin/index"
end

post '/admin' do
  new_admin = Admin.new
  new_admin.name = params[:name]
  new_admin.email = params[:email]
  new_admin.save
  binding.pry
  redirect "/admin"
end

get '/students/new' do
  if no_authentication?
    erb :"student/new"
  else
    erb :"student/new"
  end
end

get '/students' do
  @students = Student.all
  erb :"student/index"
end

post '/students' do
  new_stud = Student.new
  new_stud.name = params[:name]
  new_stud.email = params[:email]
  new_stud.save
  redirect "/students"
end

get '/' do
  if no_authentication?
    erb :"index"
  else
    erb :"index"
  end
end