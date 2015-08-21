class AddTypesToOpportunities < ActiveRecord::Migration
  def change
  	add_column :opportunities, :o_type, :string
  	add_column :opportunities, :delivery_status, :string
  	add_column :opportunities, :is_private, :string
  	add_column :opportunities, :forecast_category_name, :string
  end
end
