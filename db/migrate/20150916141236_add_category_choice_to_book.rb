class AddCategoryChoiceToBook < ActiveRecord::Migration
  def change
    add_column :books, :choice, :string
  end
end
