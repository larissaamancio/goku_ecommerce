require "rails_helper"

RSpec.describe Customer, :type => :model do

  describe Customer do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:zip_code) }
  end

end

  
