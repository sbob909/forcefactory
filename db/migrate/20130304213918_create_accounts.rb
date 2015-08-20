class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :sfdc_id
      t.string :account_name
      t.string :account_number, :limit => 40
      t.string :account_source 
      t.decimal :annual_revenue, :precision => 18, :scale => 2
      t.string :billing_street
      t.string :billing_city
      t.string :billing_state
      t.string :billing_country
      t.string :billing_postal_code
      t.string :billing_longitude, :precision=>10, :scale=>6
      t.string :billing_latitude, :precision=>10, :scale=>6
      t.string :description, :limit => 100
      t.integer :number_of_employees
      t.string :fax, :limit => 50
      t.string :industry
      t.string :phone, :limit => 50
      t.string :rating
      t.string :shipping_street
      t.string :shipping_city
      t.string :shipping_state
      t.string :shipping_country
      t.string :shipping_postal_code
      t.string :shipping_longitude, :precision=>10, :scale=>6
      t.string :shipping_latitude, :precision=>10, :scale=>6
      t.string :sic_code, :limit => 5
      t.string :type
      t.string :website
      t.string :active
      t.string :customer_priority
      t.integer :number_of_locations
      t.string :sla
      t.date :sla_expiration_date
      t.string :sla_serial_number
      t.string :upsell_opportunity
    end
  end
end
