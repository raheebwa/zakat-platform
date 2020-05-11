class HomeController < ApplicationController
  before_action :set_payment, only: [:destroy_payment]
  before_action :authenticate_user!, only: %i[calculator]

  def index
  end

  def about
  end

  def contact
  end

  def calculator
    @payment = Payment.new
  end

  def pay_zakat
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to "/my-payments", notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :calculator }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def my_payments
    @payments = current_user.payments
  end

  def destroy_payment
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to "/my-payments", notice: 'Payment was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:user_id, :cash, :credit, :debit, :assets, :current_nisab, :zakat_paid)
  end
end
