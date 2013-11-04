class MyRackMiddleware
  def initialize(appl)
    @appl = appl
  end

  def call(env)
    start = Time.now if debug?(env)
    status, headers, body = @appl.call(env)
    stop = Time.now if debug?(env)
    puts "Response time: #{stop - start}" if debug?(env)
    [status, headers, body]
  end
  
  def debug?(env)
    req = Rack::Request.new(env)
    req.params["debug"] == "1"
  end    
end