class Book < ApplicationRecord
  belongs_to :user

  has_one_attached :profile_image

  def get__profileimage
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
     image
  end
end
