class CompaniesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  load_and_authorize_resource :only =>[:new, :create, :edit, :update, :destroy]

  def search_companies
    @companies = Company.where("name LIKE ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find params[:id]
    
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new company_params.merge(user_id: current_user.id)
    if @company.save
      gflash :success => "Your restaurant has been added successfully!"
      redirect_to companies_path
    else
      gflash :now, :error => "Something went wrong."
      render :new
    end
  end

  def edit
    @company = Company.find params[:id]
  end

  def update
    @company = Company.find params[:id]
    @company.update_attributes company_params
    redirect_to company_path(@company)
  end

  def destroy
    @company = Company.find params[:id]
    @company.delete
    redirect_to companies_path
  end

private
  def company_params
    params.require(:company).permit(:name, :email, :number, :address, :avatar)
  end
end
