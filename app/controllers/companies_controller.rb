class CompaniesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

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
    @company = Company.new company_params
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
    redirect_to companies_path
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
