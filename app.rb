require 'sinatra'
require 'pony'

get '/' do
  erb :"home.html"
end

post '/' do
	Pony.mail({
	:from => params[:email],
	:to => 'gulnara@gulnara.me',
	:subject => "has contacted you via the Website",
	:body => params[:message],
	:via => :smtp,
	:via_options => {
	:address              => 'smtp.mandrillapp.com',
	:port                 => '587',
	:enable_starttls_auto => true,
	:user_name            => 'gmirzaka@gmail.com',
	:password             => '',
	:authentication       => :plain, 
	:domain               => "codebeta.co" 
	}
	})
	redirect '/success' 
end


get('/success') do
	@notification = "Thanks for your email. I'll be in touch soon."
	erb :"reload.html"
end

