class User < ActiveRecord::Base

    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    include TheComments::User
    include TheComments::Commentable


    has_many :posts



    # IT'S JUST AN EXAMPLE OF ANY ROLE SYSTEM


    # YOU HAVE TO IMPLEMENT YOUR ROLE POLICY FOR COMMENTS HERE
    def comments_admin?
        admin?
    end

    def comments_moderator? comment
        id == comment.holder_id
    end
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable



    has_attached_file :image, styles: { medium: "100000x100000>", thumb: "50x50>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    validates :display_name, presence: true, length: { minimum: 1 }, uniqueness: { :scope => :display_name }

    # Don't want to remove topics other users have posted on

    has_many :topics

    has_many :posts, :dependent => :destroy



    before_save :check_admin

    private
        def check_admin
            if (User.count == 0)
                self.admin = true
            end
            return true
        end
end
