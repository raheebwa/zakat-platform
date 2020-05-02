class HomeController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def calculator
  end

  def my_payments
    @payments = current_user.payments
  end
end
