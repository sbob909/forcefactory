# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150331134938) do

  create_table "accounts", :force => true do |t|
    t.string  "sfdc_id"
    t.string  "account_name"
    t.string  "account_number",       :limit => 40
    t.string  "account_source"
    t.decimal "annual_revenue",                      :precision => 18, :scale => 2
    t.string  "billing_street"
    t.string  "billing_city"
    t.string  "billing_state"
    t.string  "billing_country"
    t.string  "billing_postal_code"
    t.string  "billing_longitude"
    t.string  "billing_latitude"
    t.string  "description",          :limit => 100
    t.integer "number_of_employees"
    t.string  "fax",                  :limit => 50
    t.string  "industry"
    t.string  "phone",                :limit => 50
    t.string  "rating"
    t.string  "shipping_street"
    t.string  "shipping_city"
    t.string  "shipping_state"
    t.string  "shipping_country"
    t.string  "shipping_postal_code"
    t.string  "shipping_longitude"
    t.string  "shipping_latitude"
    t.string  "sic_code",             :limit => 5
    t.string  "type"
    t.string  "website"
    t.string  "active"
    t.string  "customer_priority"
    t.integer "number_of_locations"
    t.string  "sla"
    t.date    "sla_expiration_date"
    t.string  "sla_serial_number"
    t.string  "upsell_opportunity"
  end

  create_table "opportunities", :force => true do |t|
    t.string  "sfdc_id"
    t.string  "account_id"
    t.string  "name"
    t.decimal "amount",                 :precision => 8, :scale => 2
    t.string  "stage"
    t.string  "lead_source"
    t.date    "closed_on"
    t.integer "order_number"
    t.string  "o_type"
    t.string  "delivery_status"
    t.string  "is_private"
    t.string  "forecast_category_name"
  end

  add_index "opportunities", ["account_id"], :name => "index_opportunities_on_account_id"

end
