require 'faker'
require 'populator'

namespace :db  do
  desc "Create some fake accounts to generate real SFDC Ids"
  task :fake_accounts => :environment do
    print "How many fake Accounts do you want? "
    num_accounts = $stdin.gets.to_i
    
    # create the specified accounts
    Account.populate num_accounts do |acct|
      acct.name = Faker::Company.name
    end
    
    print "#{num_accounts} created.\n"
  end
  
  desc "Create some fake opportunities using given Account Ids"
  task :fake_opportunities => :environment do
    # prompt for an array of Account Ids
    print "Enter some validated Account Ids (separated by a space): "
    accounts = $stdin.gets.split(" ").map { |s| s }
    # array of valid Opportunity stages
    stages = ['Prospecting', 'Qualification', 'Needs Analysis', 'Value Proposition', 'Id. Decision Makers', 'Perception Analysis', 'Proposal/Price Quote', 'Negotiation/Review', 'Closed Won', 'Closed Lost']
    # arry of valid lead sources
    sources = ['External Referral', 'Web', 'Phone Inquiry', 'Purchased List']    

    # prompt for the number of records to create
    print "How many fake Opportunities do you want? "
    num_opps = $stdin.gets.to_i

    # create the opportunity records
    Opportunity.populate num_opps do |opp|
      opp.account_id = accounts
      opp.name = Faker::Company.name
      opp.amount = [50000, 100000, 500000]
      opp.stage = stages
      opp.lead_source = sources
      opp.closed_on = 3.years.ago..Time.now
      opp.order_number = 1000..500000
    end
    
    print "#{num_opps} created.\n"
  end

end