class V1::GreetingsController < ApplicationController
  def index
    greeting = Greeting.all.order('random()').first
    render json: {
      greeting: greeting.message
    }
  end

  def default_route
    render json: {
      error: 'Route not present'
    }
  end
end
