class Restaurant < ActiveRecord::Base
     mount_uploader :image, ImageUploader

     has_many :reviews

     validates :name, :address, :phone, :website, :image, presence: true
    validates :phone, format: { with: /\A((90[0-9]{3})?0|\+358\s?)(?!(100|20(0|2(0|[2-3])|9[8-9])|300|600|700|708|75(00[0-3]|(1|2)\d{2}|30[0-2]|32[0-2]|75[0-2]|98[0-2])))(4|50|10[1-9]|20(1|2(1|[4-9])|[3-9])|29|30[1-9]|71|73|75(00[3-9]|30[3-9]|32[3-9]|53[3-9]|83[3-9])|2|3|5|6|8|9|1[3-9])\s?(\d\s?){4,19}\z/,
    message: "must be a Finnish phone number" }
    validates :website, format: { with: /\Ahttps?:\/\/.*\z/,
    message: "must start with http:// or https://" }
    validates :address, format: { with: /\A\d+[^,]+,[^,]+, [A-Z]{2} \d{5}\z/,
    message: "must be in the format '350 Fifth Avenue, New York, NY 10118'" }
end
