class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :sales
  has_attached_file :image
  has_attached_file :resource

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/, massage: 'Only image allowed'
  validates_attachment :resource, content_type: { content_type: 'application/pdf' }, massage: 'Only pdf allowed'

  validates :image, attachment_presence: true
  validates :resource, attachment_presence: true

  validates_numericality_of :price, greater_than: 49, message: 'must be at least 50 cents'

end
