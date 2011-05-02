class OptimalProductController < ApplicationController
  
  before_filter :set_initial_variables
  
  def range_rand(min,max)
    min + rand(max-min)
  end
    
  def set_initial_variables
    @default_date_array = "0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 20"
    @default_probability_range = "0..100"
    @default_average_cost = '1400'
    @default_deviation_cost = '20'
    @default_offers = '18'
    @default_average_delivery_days = '3'
    @default_average_probability = '80'
    
    @date_array = (params[:date_array] ? params[:date_array] : @default_date_array).split(',').collect(&:to_i)
    @probability_array = eval(params[:probability_range] ? params[:probability_range] : @default_probability_range).collect
    
    @average_cost = (params[:average_cost] ? params[:average_cost] : @default_average_cost).to_f
    @deviation_cost = (params[:deviation_cost] ? params[:deviation_cost] : @default_deviation_cost).to_f
    
    @offers = (params[:offers] ? params[:offers] : @default_offers).to_i

    @cost_array = []
    @offers.times do
      @cost_array << range_rand(@average_cost - (@average_cost/100*@deviation_cost), @average_cost + (@average_cost/100*@deviation_cost))
    end
    
    2.times do
      @cost_array << @average_cost * (rand + 2)
    end
    
    @average_delivery_days = (params[:average_delivery_days] ? params[:average_delivery_days] : @default_average_delivery_days).to_f
    @average_probability = (params[:average_probability] ? params[:average_probability] : @default_average_probability).to_f
    
  end
  
  def index
  end
  
  # TODO Здесь учитывается возможность вероятности только от 0
  
  def choose
    @product_array = @date_array.product(@cost_array, @probability_array)
    @product_array.each do |element|
      element[element.size] = 
        params[:delivery_days].to_f * (element[0].to_f / @average_delivery_days * 100) + 
        params[:cost].to_f * (element[1].to_f / @average_cost * 100) + 
        params[:probability].to_f * (@probability_array.max - element[2].to_f) / @average_probability * 100
    end

    @product_array.shuffle!
    
    (@product_array.size - @offers).times do |i|
      @product_array.pop
    end

    
    @product_array = @product_array.sort_by do |element|
      element[3]
    end
    
  end    
  
end