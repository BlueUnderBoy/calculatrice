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
  erb(:random)
end

get("/payment/new") do
  erb(:payment)
end

get("/square/results") do
    @num = params.fetch("number").to_f
    @ns = (@num * @num).to_f
  erb(:square_results)
end

get("/square_root/results") do
  @num = params.fetch("number").to_f
  @nsr = Math.sqrt(@num)
erb(:squareroot_results)
end

get("/payment/results") do 
  @raw_apr = params.fetch("apr").to_f
  @raw_years = params.fetch("years").to_f
  @raw_principal = params.fetch("principal").to_f

  @apr = format('%.4f', @raw_apr.to_f)  
  @years = @raw_years
  @principal = @raw_principal.to_fs(:currency)

  @rate = @raw_apr / 100.0 / 12 
  @n = (@years * 12)
  p1 = (@rate * @raw_principal)
  p2 = (1 - ((1 + @rate)**(-@n)))  

  if p2.zero?
    @payment = 0 
  else
    @payment = (p1 / p2).to_fs(:currency)
  end

  erb(:payment_results)
end

get("/random/results") do

  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f

  @random = rand(@min..@max)
  erb(:random_results)
end 
