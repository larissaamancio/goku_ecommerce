class Customer < ActiveRecord::Base
  validates_presence_of :name, :zip_code

  scope :most_recent, ->{order("created_at DESC")}

end