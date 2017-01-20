class AddDraftToBooks < ActiveRecord::Migration
  def change
    add_column :books, :draft, :boolean, default: nil
  end
end
