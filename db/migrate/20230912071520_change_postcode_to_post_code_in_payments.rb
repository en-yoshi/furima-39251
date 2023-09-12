class ChangePostcodeToPostCodeInPayments < ActiveRecord::Migration[6.0]
  def change
    rename_column :payments, :postcode, :post_code
  end
end
