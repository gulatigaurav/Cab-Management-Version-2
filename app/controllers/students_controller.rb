class StudentsController < ApplicationController
  def index
   @users = User.all
  end
end
