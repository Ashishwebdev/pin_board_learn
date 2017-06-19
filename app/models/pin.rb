class Pin < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :description, presence: true
  validates :title, presence: true
  before_save :pin_user_update
  mount_uploader :image, ImageUploader
private
  def pin_user_update
    self[:user_id] = user_id
  end
end
