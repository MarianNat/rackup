class MyRackMiddleware
  def initialize(appl)
    @appl = appl
  end
	def call(env)
		start = Time.now

	 status, headers, body = @appl.call(env)
	  append_s = ".... MyRackMiddleware"

	  req = Rack::Request.new(env)
	  #append_s = req.params.to_s
     	stop = Time.now

     	#append_s = "Response timeee #{stop - start}"
     	puts "Response timeee #{stop - start}"
     	

	  body << append_s if req.params["d"] == "1"
	  [status, headers, body]
	end
end