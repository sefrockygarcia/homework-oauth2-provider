class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy renew_secret ]

  # GET /companies or /companies.json
  def index
    @companies = current_user.companies
  end

  # GET /companies/1 or /companies/1.json
  def show
    @users = @company.users
  end

  # GET /companies/new
  def new
    @company = current_user.companies.build
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        current_user.companies.push @company
        format.html { redirect_to company_url(@company), notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # PUT /companies/1/renew_secret
  def renew_secret
    oauth_app = @company.oauth_application
    oauth_app.renew_secret
    if oauth_app.save
      @company.access_tokens.update revoked_at: 1.minute.ago 
      redirect_to company_url(@company), notice: "Secret was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name)
    end
end
