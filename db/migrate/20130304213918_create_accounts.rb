class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :sfdc_id
      t.string :name
    end
  end
end
