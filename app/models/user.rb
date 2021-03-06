class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :links
  has_many :comments
  validates :name, presence: true, uniqueness: true, length: {maximum: 8}
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", thumbnail: "60x60#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
