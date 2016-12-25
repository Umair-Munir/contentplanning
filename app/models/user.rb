class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #has_many :articles, dependent: :destroy
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:invite_for => 2.weeks

has_many :articles
has_and_belongs_to_many :roles

  def full_name
    [first_name, last_name].join(' ').blank? ? email : [first_name, last_name].join(' ')
  end

  def admin?
    status = false
    self.roles.each do|role|
      status = role.title == 'Admin'
    end
    status
  end

  def editor?
    status = false
    self.roles.each do|role|
      status = role.title == 'Editor'
    end
    status
  end
end
