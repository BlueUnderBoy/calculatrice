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
  erb(:square_root)
end

get("/random/new") do
  erb(:homepage)
end

get("/payment/new") do
  erb(:homepage)
end

get("/square/results") do
    @num = params.fetch("number").to_i
    @ns = (@num * @num).to_f
  erb(:square_results)
end

get("/square_root/results") do
  @num = params.fetch("number").to_i
  @nsr = Math.sqrt(@num)
erb(:squareroot_results)
end
