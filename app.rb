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
  erb(:payment)
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

get("/payment/results") do
  @raw_apr = params.fetch("apr").to_i
  @raw_years = params.fetch("years").to_i
  @raw_principal = params.fetch("principal").to_i

  @apr = format('%.4f', @raw_apr.to_i)
  @years = @raw_years
  @principal = format('%.2f', params.fetch("principal").to_i)

  @rate = @raw_apr / 100
  @n = (@years * 12)
  p1 = (@rate * @raw_principal)
  p2 = (1-(1 + @rate))
  @payment = p1 / p2

  erb(:payment_results)
end
