class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_user

  def index
    @customers = Customer.most_recent
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def find_by_cep
    render :json => BuscaEndereco.cep(params[:id])
  rescue RuntimeError
    render :json => ["", "zipcode nao encontrado", "", "", ""].to_json
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :zip_code, :street, :state, :city, :neighborhood, :number)
    end

    def authorize_user
      unless current_user
        redirect_to root_path, alert: "You need to login to continue."
      end
    end
end