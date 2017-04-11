class GeneralController < ApplicationController
  
  def home
    
  end

  def donor_dashboard
  	@donations = current_donor.bloods.reverse
  end

  def bank_dashboard
  	@donations = current_bank.bloods.reverse
  end

  def requests
    @requests = current_bank.orders.reverse
  end

  def hospital_dashboard
  	@orders = current_hospital.orders.reverse
  end

  def accept_request
    request = Order.find(params[:request_id])
    request.granted!
    redirect_to requests_path
  end

  def reject_request
    request = Order.find(params[:request_id])
    request.rejected!
    redirect_to requests_path
  end

end
