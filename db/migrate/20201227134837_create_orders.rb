class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer        :item_id,    null: false, foreign_key: true
      t.integer        :buyer_id,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
