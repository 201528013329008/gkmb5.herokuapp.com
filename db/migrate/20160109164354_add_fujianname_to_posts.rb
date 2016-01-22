class AddFujiannameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :fujianname, :string
  end
end
