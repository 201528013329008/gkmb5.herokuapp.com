class Post < ActiveRecord::Base
    include TheComments::Commentable



    # Denormalization methods
    # Check the documentation for information on advanced usage
    def commentable_title
        "Undefined Post Title"
    end

    def commentable_url
        "#"
    end

    def commentable_state
        :published.to_s
    end
    validates :body, presence: true, length: { minimum: 0 }
    validates :biaoti, presence: true, length: { minimum: 1 }
    has_attached_file :image, styles: { medium: "100000x100000>", thumb: "50x50>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


    belongs_to :topic
    belongs_to :user



    require 'carrierwave/orm/activerecord'
    mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    validates :fujianname,  length: { minimum: 0 }# Make sure the owner's name is present.



end
