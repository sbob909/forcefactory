class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :sfdc_id
      t.string :account_id
      t.string :name
      t.decimal :amount, :precision => 8, :scale => 2
      t.string :stage
      t.string :lead_source
      t.date :closed_on
      t.integer :order_number
    end
    add_index :opportunities, :account_id
  end
end
