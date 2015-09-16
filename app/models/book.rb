class Book < ActiveRecord::Base
  validates :book_uuid, uniqueness: true
  paginates_per 15
  def next
    Book.where(["id > ?", id]).order(id: :asc).first
  end
end
