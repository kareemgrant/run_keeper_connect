require 'runkeeper'

class UsersController < ApplicationController
  def index
    access_token = "3ca45a09c88c4dd0bda192e869fdbb80"
    data = Runkeeper::User.new(access_token)
    binding.pry
  end
end
