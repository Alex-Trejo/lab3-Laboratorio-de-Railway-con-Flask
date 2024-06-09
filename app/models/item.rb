class Item < ApplicationRecord
    has_one_attached :image
  
    validate :image_type
  
    private
  
    def image_type
      if image.attached? && !image.content_type.in?(%w(image/png image/jpg image/jpeg image/gif))
        errors.add(:image, 'must be a PNG, JPG, JPEG, or GIF')
      elsif image.attached? && image.byte_size > 15.megabyte
        errors.add(:image, 'is too big, should be less than 1MB')
      end
    end
  end
  