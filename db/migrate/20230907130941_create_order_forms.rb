class CreateOrderForms < ActiveRecord::Migration[6.0]
  def change
    create_table :order_forms do |t|

      t.timestamps
    end
  end
end
