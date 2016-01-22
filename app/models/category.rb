class Category < ActiveRecord::Base
    has_many :topics, :dependent => :destroy

    validates :title, presence: true, length: { minimum: 1 }
    has_attached_file :image, styles: { medium: "100000x100000>", thumb: "50x50>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
