require "rails_helper"

RSpec.describe CustomersController, :type => :controller do

  let(:user) { create(:user) }
  let(:valid_attributes) { { "name" => "Marinho", "zip_code" => "01013020" } }
  let(:valid_session) { {} }
  render_views

  describe "GET index" do
    before do
      sign_in :user, user
      get :index
    end

    it 'response succesful' do
      expect(response).to be_successful
    end

    it 'render template customer' do
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do
    before do
      sign_in :user, user
      get :new
    end

    it 'render new' do
      get :new, {}, valid_session
      assigns(:customer).should be_a_new(Customer)
    end
  end

  describe "POST create" do
    before do
      sign_in :user, user
      get :new
    end

    describe "with valid params" do
      it "creates a new Customer" do
        expect {
          customer = create(:customer), valid_session
        }.to change(Customer, :count).by(1)
      end

      it "assigns a newly created customer as @customer" do
        post :create, {:customer => valid_attributes}, valid_session
        assigns(:customer).should be_a(Customer)
        assigns(:customer).should be_persisted
      end

      it "redirects to the created customer" do
        post :create, {:customer => valid_attributes}
        response.should redirect_to(Customer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved customer as @customer" do
        Customer.any_instance.stub(:save).and_return(false)
        post :create, {:customer => { "name" => "invalid value" }}, valid_session
        assigns(:customer).should be_a_new(Customer)
      end

      it "re-renders the 'new' template" do
        Customer.any_instance.stub(:save).and_return(false)
        post :create, {:customer => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end
end

