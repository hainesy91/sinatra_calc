require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

get '/' do
  @operator = params[:operator]
  if @operator
    @first = params[:first].to_f
    @second = params[:second].to_f
    
    @result = case @operator
    when '+' then @first + @second
    when '-' then @first - @second
    when '*' then @first * @second
    when '/' then @first / @second
    end
  end
  erb :home
end

get '/power' do
  @first = params[:first].to_f

  if @first
    @second = params[:second].to_f
    @result = @first ** @second
  end
  erb :power
end

get '/sqrt' do
  @first = params[:first].to_f

  if @first
    @sqrtresult = Math.sqrt(@first).to_f
  end
  erb :sqrt
end

get '/bmi' do
  @weight = params[:weight].to_f

  if @weight > 0.0
  @height = params[:height].to_f
  @bmiresult = @weight / (@height * @height).to_f
  end
  erb :bmi
end

get '/mortgage' do
    @principal = params[:principal].to_f
    @int_rate = params[:int_rate].to_f
    @num_payments = params[:num_payments].to_i

    @result_mort_calc = (@principal * (@int_rate * (1 + @int_rate)**@num_payments) / ((1+@int_rate)**@num_payments - 1)).round(2)

    erb :mortgage
end