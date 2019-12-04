class ChangePriceToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :services, :total_price, :float
  end
end
