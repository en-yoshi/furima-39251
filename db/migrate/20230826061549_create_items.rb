class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                  null: false
      t.text       :description,           null: false
      t.integer    :category_id,           null: false
      t.integer    :item_status_id,        null: false
      t.integer    :fee_status_id,         null: false
      t.integer    :prefecture_id,         null: false
      t.integer    :delivery_schedule_id,  null: false
      t.integer    :price,                 null: false
      t.references :user,                  null: false, foreign_key: true
      #README記載の内容

      t.timestamps
    end
  end
end
