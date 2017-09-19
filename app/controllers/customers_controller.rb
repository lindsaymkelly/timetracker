class CustomersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @customer = Customer.new
  end

  def create 
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to root_path
    else
      @errors = @customer.errors.full_messages
      render 'new'
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:company, :address, :city, :state, :zip)
    end
end
