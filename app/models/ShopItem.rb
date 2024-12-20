# app/models/shop.rb
class ShopItem < ApplicationRecord
  # Other model code...

  # Define allowed attributes for searching
  def self.ransackable_attributes(auth_object = nil)
    %w[name description amount price]
  end
end
