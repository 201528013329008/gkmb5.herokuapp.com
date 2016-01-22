class AddAttachmentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :attachment, :string
  end
end
