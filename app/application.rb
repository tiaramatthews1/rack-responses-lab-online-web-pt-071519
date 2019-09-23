class Application


  @@items = ["Apples","Carrots","Pears"]
	@@cart = []


  def call(env)	  def call(env)
    resp = Rack::Response.new
  -10,6 +11,22 @@ def call(env)
      @@items.each do |item|
        resp.write "#{item}\n"
      end	      end
		elsif req.path.match(/cart/)
			if @@cart.empty?
				resp.write "Your cart is empty"
			else
				@@cart.each do |item|
	        resp.write "#{item}\n"
	      end
			end
		elsif req.path.match(/add/)
			item = req.params["item"]
			if 	@@items.include?(item)
				@@cart << item
				resp.write "added #{item}"
			else
				resp.write "We don't have that item"
			end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
