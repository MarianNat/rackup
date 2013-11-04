# my_app.rb
require "./get_params"
class MyApp
  include GetParams
  def call(env)
  	file = File.open("index.html", "r")
  	data = file.read
    file.close 	
    params = get_params(env)
    data << params[:test].to_s
    [200, {"Content-Type" => "text/html"}, ["#{data}"]]
  end
end