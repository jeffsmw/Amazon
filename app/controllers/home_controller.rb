class HomeController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def submission
    @user_name = params[:user_name]
  end

  def faq
  end
end
