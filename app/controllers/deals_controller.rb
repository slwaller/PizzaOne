class DealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @deals = Deal.all
    @company = Company.find params[:company_id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @company = Company.find params[:company_id]
    @deal = Deal.find params[:id]
  end

  def new
    @deal = Deal.new
    @company = Company.find params[:company_id]
  end

  def create
    @company = Company.find params[:company_id]
    @deal = @company.deals.new(deal_params)
      respond_to do |format|
        if @deal.save
          format.html { redirect_to company_deals_path(@company), notice: 'Deal Successfully Added!' }
        else
          format.html { render :new }
        end
      end
  end

  def edit
    @company = Company.find params[:company_id]
    @deal = Deal.find params[:id]
  end

  def update
    @company = Company.find params[:company_id]
    @deal = Deal.find params[:id]
    if @deal.update_attributes deal_params
      redirect_to companys_path  
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find params[:company_id]
    @deal = Deal.find params[:id]
    @deal.delete
    redirect_to companys_path
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :description, :price)
  end

end
