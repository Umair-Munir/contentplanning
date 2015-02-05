class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #has_many :articles, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :articles
has_and_belongs_to_many :roles

  def full_name
    [first_name, last_name].join(' ').blank? ? email : [first_name, last_name].join(' ')
  end

end
