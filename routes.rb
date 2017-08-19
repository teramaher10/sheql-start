get '/activities' do
  @user = current_user
  @activities = Activity.all
  erb :"activity/activities"
end

get '/activities/new' do
  @user = current_user
    erb :"activity/new"
end

post '/activities' do
  @user = current_user
  new_act = Activity.new
  new_act.location = params[:location]
  new_act.supervisor = params[:supervisor]
  new_act.sup_email = params[:sup_email]
  new_act.description = params[:description]
  new_act.hours = params[:hours]
  new_act.date = params[:date]
  new_act.title = params[:title]
  new_act.save
  redirect "/activities"
end

get '/activities/:id' do
  @user = current_user
  id = params[:id].to_i
  @activity = Activity.find(id)
  erb :"activity/show"
end

get '/activities/:id/edit' do #load edit form
    @user = current_user
    id = params[:id].to_i
    @activity = Activity.find(id)
    erb :"/activity/edit"
end

patch '/activities/:id' do #edit action
  @user = current_user
  id = params[:id].to_i
  @activity = Activity.find(id)
  @activity.location = params[:location]
  # @activity.date = params[:date]
  @activity.supervisor = params[:supervisor]
  @activity.sup_email = params[:sup_email]
  @activity.hours = params[:hours]
  @activity.description = params[:description]
  @activity.date = params[:date]
  @activity.title = params[:title]
  @activity.save
  redirect "/activities"
end

get '/activities/:id/delete' do #load edit form
    @user = current_user
    id = params[:id].to_i
    @activity = Activity.find(id)
    erb :"/activity/delete"
end

delete '/activities' do #delete action
  @user = current_user
  id = params[:id].to_i
  @activity = Activity.find(id)
  @activity.delete
  redirect '/activities'
end



get '/admin' do
  @user = current_user
  @admins = Admin.all
  erb :"admin/index"
end

get '/admin/new' do
  @user = current_user
  if no_authentication?
    erb :"admin/new"
  else
    erb :"admin/new"
  end
end

post '/admin' do
  @user = current_user
  new_admin = Admin.new
  new_admin.name = params[:name]
  new_admin.email = params[:email]
  new_admin.save
  binding.pry
  redirect "/admin"
end




get '/students' do
  @user = current_user
  @students = Student.all
  erb :"student/index"
end

get '/students/:id/edit' do #load edit form
    @user = current_user
    id = params[:id].to_i
    @student = Student.find(id)
    erb :"/student/edit"
end

patch '/students/:id' do #edit action
  @user = current_user
  id = params[:id].to_i
  @student = Student.find(id)
  @student.name = params[:name]
  @student.save
  redirect "/activities/new"
end

get '/students/:id/delete' do #load edit form
    @user = current_user
    id = params[:id].to_i
    @student = Student.find(id)
    erb :"/student/delete"
end

delete '/students' do #delete action
  @user = current_user
  id = params[:id].to_i
  @student = Student.find(id)
  @student.delete
  redirect '/student/index'
end



get '/' do
  @user = User.find(session[:current_user_id])
  "Hi, #{@user.name}.  <img style='width:60px; border-radius:50%;' src='#{@user.picture}' >"
  if no_authentication?
    erb :"index"
  else
    erb :"index"
  end
end



