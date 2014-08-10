class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :polishes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :owns, dependent: :destroy
  has_many :wants, dependent: :destroy

  def role?(base_role)
  	role == base_role.to_s
  end

  def favorited(polish)
  	favorites.where(polish_id: polish.id).first
  end

  def owned(polish)
    owns.where(polish_id: polish.id).first
  end

  def wanted(polish)
    wants.where(polish_id: polish.id).first
  end
end
