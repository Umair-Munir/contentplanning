class Article < ActiveRecord::Base

  acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :category
  belongs_to :status
  #has_many :tags

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true


end
