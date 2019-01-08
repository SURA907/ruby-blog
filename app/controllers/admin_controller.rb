class AdminController < ApplicationController
  def login
  end
  def signin
    @data = {:code=> 0, :message=> 'test'}
    redirect_to 'login'
  end
end