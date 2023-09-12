class ChangeBlockToHouseNumberInPayments < ActiveRecord::Migration[6.0]
  def change
    rename_column :payments, :block, :house_number
  end
end
