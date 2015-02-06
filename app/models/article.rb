class Article < ActiveRecord::Base
  #require 'carrierwave/orm/activerecord'
  #mount_uploader :image, ImageUploader
  acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :category
  belongs_to :status
  #has_many :tags

  default_scope ->{ where(created_flag: true)}

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  #validates :title, presence: true, uniqueness: true
  #validates :description, presence: true

  def self.clean
    self.unscoped.where(created_flag: false).delete_all
  end

end
