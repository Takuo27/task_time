class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :achievements     
  has_many :tasks
  validates :image, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 7 }, on: :create
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  
  def full_name
    first_name + " " + last_name
  end

  def full_name_kana
    kana_first_name + " " + kana_last_name
  end
  
  has_one_attached :image
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def following?(user)
     followings.include?(user)
  end
  
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
  
  def update_without_current_password(params, *options)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end
    
end
