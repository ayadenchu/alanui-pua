class CreateBuds < ActiveRecord::Migration[6.0]
  def change
    create_table :buds do |t|
      t.references :user,      foreign_key: true
      t.references :post,      foreign_key: true
      t.timestamps
    end
  end
end
