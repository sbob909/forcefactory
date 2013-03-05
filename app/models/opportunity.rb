class Opportunity < ActiveRecord::Base
  belongs_to :account
  attr_accessible :amount, :closed_on, :lead_source, :name, :order_number, :sfdc_id, :stage
end
