require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  erb(:homepage)
end

get("/square/new") do
  erb(:homepage)
end

get("/square_root/new") do
  erb(:homepage)
end

get("/random/new") do
  erb(:homepage)
end

get("/payment/new") do
  erb(:homepage)
end

get("/square/results") do
    @num = params.fetch("number")
    @ns = @num * @num
    

  erb(:square_results)
end
