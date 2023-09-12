class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :house_number, :building, :phone_number, :token

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # paymentモデルのバリデーション
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含めた半角文字列で入力してください' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を入力してください' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'は10桁以上11桁以内の半角数値で入力してください' }
    # トークンのバリデーション
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Payment.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city,
                   house_number: house_number, building: building, phone_number: phone_number)
  end
end
