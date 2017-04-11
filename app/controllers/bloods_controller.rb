# class DonationsController < ApplicationController
#   before_action :set_blood, only: [:edit]
#   def new
#   	@blood = Blood.new
#   end

#   def create
#   	@blood = Blood.new(blood_params)
#   	@blood.donor = current_donor
#   	@blood.bank = Bank.find(params[:blood][:bank_id])
#   	@blood.save
#   	redirect_to donor_dashboard_path
#   end

#   def edit
#   	@blood = Blood.update(blood_params)
#   end

#   private
  
#   def set_blood
#   	@blood = Blood.find(params[:blood])
#   end

#   def blood_params
#   	params.require(:blood).permit(:type, :amount)
#   end

# end

class BloodsController < ApplicationController
  
  before_action :set_blood , only: [:show, :edit, :update]
  before_action :authenticate_donor! , only: [:new, :edit, :create, :update]
  before_action :check_authority , only: [:update, :edit]

  def new
    @blood = Blood.new
  end

  def edit
  end

  def create
    @blood = Blood.new(blood_params)
    @blood.donor = current_donor
    @blood.bank = Bank.find(params[:blood][:bank_id])
    respond_to do |format|
      if @blood.save
        format.html { redirect_to donor_dashboard_path, notice: 'Donation was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
  	@blood.bank = Bank.find(params[:blood][:bank_id])
    respond_to do |format|
      if @blood.update(blood_params)
        format.html { redirect_to @blood, notice: 'Donation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blood
      @blood = Blood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blood_params
 		 	params.require(:blood).permit(:category, :amount)
    end

    def check_authority
      if current_donor == @blood.donor
        true
      else
        redirect_to donor_dashboard_path , alert: "Unauthorized to make any change"
        return
      end
    end
    
end
