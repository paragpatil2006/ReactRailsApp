class SellerItem < ApplicationRecord
  belongs_to :seller
  belongs_to :item
end
