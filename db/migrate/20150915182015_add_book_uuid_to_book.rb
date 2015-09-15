class AddBookUuidToBook < ActiveRecord::Migration
  def change
    add_column :books, :book_uuid, :string
  end
end
