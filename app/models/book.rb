class Book < ActiveRecord::Base
  validates :book_uuid, uniqueness: true
  paginates_per 15
end
