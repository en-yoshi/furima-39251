class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :fee_status
  belongs_to :prefecture
  belongs_to :delivery_schedule

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :fee_status_id
    validates :prefecture_id
    validates :delivery_schedule_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  #プルダウンのエラー
    validates :category_id, numericality: { other_than: 0 , message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank" }
    validates :item_status_id, numericality: { other_than: 0 , message: "can't be blank" }
    validates :fee_status_id, numericality: { other_than: 0 , message: "can't be blank" }
    validates :delivery_schedule_id, numericality: { other_than: 0 , message: "can't be blank" }
  
end
