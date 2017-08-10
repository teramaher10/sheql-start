get '/activities/new' do
  if no_authentication?
    erb :"activity/new"
  else
    erb :"activity/new"
  end
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

get '/activities' do
  @activities = Activity.all
  erb :"activity/activities"
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
  @user = User.find(session[:current_user_id])
  "Hi, #{@user.name}.  <img style='width:60px; border-radius:50%;' src='#{@user.picture}' >"
  if no_authentication?
    erb :"index"
  else
    erb :"index"
  end
end