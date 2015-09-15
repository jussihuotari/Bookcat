class Book < ActiveRecord::Base
  validates :book_uuid, uniqueness: true
end
