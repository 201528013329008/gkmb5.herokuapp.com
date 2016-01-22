class AddBiaotiToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :biaoti, :text
  end
end
