class MyApp
  def call(env)
    file = File.open("index.html", "r")
    data = file.read
    file.close 	
    req = Rack::Request.new(env)
    data << "<script>document.getElementById('q_search').value='" << req.params["hello"].to_s << "';</script>" if req.params["hello"]
    [200, {"Content-Type" => "text/html"}, ["#{data}"]]
  end
end