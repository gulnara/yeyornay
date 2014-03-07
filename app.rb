require 'sinatra'
require 'pony'

get '/' do
  erb :"home.html"
end

post '/' do
	Pony.mail({
	:from => params[:email],
	:to => 'gulnara@gulnara.me',
	:subject => params[:contact_sujet],
	:body => params[:message],
	:via => :smtp,
	:via_options => {
	:address              => 'smtp.mandrillapp.com',
	:port                 => '587',
	:enable_starttls_auto => true,
	:user_name            => ENV['MANDRILL_USERNAME'],
	:password             => ENV['MANDRILL_APIKEY'],
	:authentication       => :plain, 
	:domain               => "codebeta.co" 
	}
	})
	redirect '/success' 
end


get('/success') do
	erb :"reload.html"
end


