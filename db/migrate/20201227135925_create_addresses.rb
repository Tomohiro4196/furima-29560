class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer     :order_id,      null: false, foreign_key: true
      t.string      :phone_number,  null: false
      t.integer     :prefecture_id, null: false
      t.string      :city,          null: false
      t.string      :town_block,    null: false
      t.string      :building_name
      t.string      :zip_code,      null: false
      t.timestamps
    end
  end
end
