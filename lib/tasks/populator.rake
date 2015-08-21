require 'faker'
require 'populator'

namespace :db  do
  desc "Create some fake accounts to generate real SFDC Ids"
  task :fake_accounts => :environment do
    print "How many fake Accounts do you want? "
    num_accounts = $stdin.gets.to_i

    # picklist arrays
    # array of valid Account sources
    sources = ['Other', 'Web', 'Phone Inquiry', 'Purchased List', 'Partner Referral']
    
    # array of industries
    industries = ['Agriculture', 'Apparel', 'Banking', 'Biotechnology', 'Chemicals', 'Communications', 'Construction', 'Consulting', 'Education', 'Electronics', 'Energy', 'Engineering', 'Entertainment', 'Environmental', 'Finance', 'Food & Beverage', 'Government', 'Healthcare', 'Hospitality', 'Insurance', 'Machinery', 'Manufacturing', 'Media', 'Not For Profit', 'Recreation', 'Retail', 'Shipping', 'Technology', 'Telecommunications', 'Transportation', 'Utilities', 'Other']

    # array of ratings
    ratings = ['Hot', 'Warm', 'Cold']

    # array of sic codes
    sics = ['100', '200', '700', '800', '900', '1000', '1040', '1090', '1220', '1221', '1311', '1381', '1382', '1389', '1400', '1520', '1531', '1540', '1600', '1623', '1700', '1731', '2000', '2011', '2013', '2015', '2020', '2024', '2030', '2033', '2040', '2050', '2052', '2060', '2070', '2080', '2082', '2086', '2090', '2092', '2100', '2111', '2200', '2211', '2221', '2250', '2253', '2273', '2300', '2320', '2330', '2340', '2390', '2400', '2421', '2430', '2451', '2452', '2510', '2511', '2520', '2522', '2531', '2540', '2590', '2600', '2611', '2621', '2631', '2650', '2670', '2673', '2711', '2721', '2731', '2732', '2741', '2750', '2761', '2771', '2780', '2790', '2800', '2810', '2820', '2821', '2833', '2834', '2835', '2836', '2840', '2842', '2844', '2851', '2860', '2870', '2890', '2891', '2911', '2950', '2990', '3011', '3021', '3050', '3060', '3080', '3081', '3086', '3089', '3100', '3140', '3211', '3220', '3221', '3231', '3241', '3250', '3260', '3270', '3272', '3281', '3290', '3310', '3312', '3317', '3320', '3330', '3334', '3341', '3350', '3357', '3360', '3390', '3411', '3412', '3420', '3430', '3433', '3440', '3442', '3443', '3444', '3448', '3451', '3452', '3460', '3470', '3480', '3490', '3510', '3523', '3524', '3530', '3531', '3532', '3533', '3537', '3540', '3541', '3550', '3555', '3559', '3560', '3561', '3562', '3564', '3567', '3569', '3570', '3571', '3572', '3575', '3576', '3577', '3578', '3579', '3580', '3585', '3590', '3600', '3612', '3613', '3620', '3621', '3630', '3634', '3640', '3651', '3652', '3661', '3663', '3669', '3670', '3672', '3674', '3677', '3678', '3679', '3690', '3695', '3711', '3713', '3714', '3715', '3716', '3720', '3721', '3724', '3728', '3730', '3743', '3751', '3760', '3790', '3812', '3821', '3822', '3823', '3824', '3825', '3826', '3827', '3829', '3841', '3842', '3843', '3844', '3845', '3851', '3861', '3873', '3910', '3911', '3931', '3942', '3944', '3949', '3950', '3960', '3990', '4011', '4013', '4100', '4210', '4213', '4220', '4231', '4400', '4412', '4512', '4513', '4522', '4581', '4610', '4700', '4731', '4812', '4813', '4822', '4832', '4833', '4841', '4899', '4900', '4911', '4922', '4923', '4924', '4931', '4932', '4941', '4950', '4953', '4955', '4961', '4991', '5000', '5010', '5013', '5020', '5030', '5031', '5040', '5045', '5047', '5050', '5051', '5063', '5064', '5065', '5070', '5072', '5080', '5082', '5084', '5090', '5094', '5099', '5110', '5122', '5130', '5140', '5141', '5150', '5160', '5171', '5172', '5180', '5190', '5200', '5211', '5271', '5311', '5331', '5399', '5400', '5411', '5412', '5500', '5531', '5600', '5621', '5651', '5661', '5700', '5712', '5731', '5734', '5735', '5810', '5812', '5900', '5912', '5940', '5944', '5945', '5960', '5961', '5990', '6012', '6021', '6022', '6029', '6035', '6036', '6099', '6111', '6141', '6153', '6159', '6162', '6163', '6172', '6189', '6199', '6200', '6211', '6221', '6282', '6311', '6321', '6324', '6331', '6351', '6361', '6399', '6411', '6500', '6510', '6512', '6513', '6519', '6531', '6532', '6552', '6770', '6792', '6794', '6795', '6798', '6799', '7000', '7011', '7200', '7310', '7311', '7320', '7330', '7331', '7334', '7340', '7350', '7359', '7361', '7363', '7370', '7371', '7372', '7373', '7374', '7377', '7380', '7381', '7384', '7385', '7389', '7500', '7510', '7600', '7812', '7819', '7822', '7829', '7830', '7841', '7900', '7948', '7990', '7994', '7995', '7996', '7997', '8000', '8011', '8050', '8051', '8060', '8062', '8071', '8082', '8090', '8093', '8111', '8200', '8300', '8351', '8600', '8700', '8711', '8731', '8734', '8741', '8742', '8744', '8748', '8880', '8888', '8900', '9721', '9995']

    # array of types
    account_types = ['Prospect', 'Customer - Direct', 'Customer - Channel', 'Channel Partner / Reseller', 'Installation Partner', 'Technology Partner', 'Other']

    # array of active answers
    actives = ['No', 'Yes']

    # array of customer priorities
    customer_priorities = ['High', 'Low', 'Medium']

    # array of slas
    slas = ['Gold', 'Silver', 'Platinum', 'Bronze']

    # array of upsell_opportunity answers
    upsells = ['No', 'Yes', 'Maybe']

    # create the specified accounts
    Account.populate num_accounts do |acct|
      acct.account_name = Faker::Company.name + Faker::Number.number(6)
      acct.account_number = Faker::Lorem.characters(2) + Faker::Number.number(6)
      acct.account_source = sources
      acct.annual_revenue = Faker::Number.between(50000, 1000000000)
      acct.billing_street = Faker::Address.street_address
      acct.billing_city = Faker::Address.city
      acct.billing_state = Faker::Address.state_abbr
      acct.billing_country = Faker::Address.country
      acct.billing_postal_code = Faker::Address.zip_code
      acct.billing_longitude = Faker::Address.longitude
      acct.billing_latitude = Faker::Address.latitude
      acct.description = Faker::Lorem.sentence(5)
      acct.number_of_employees = Faker::Number.positive(from=100, to=20000)
      acct.fax = Faker::PhoneNumber.phone_number
      acct.industry = industries
      acct.phone = Faker::PhoneNumber.phone_number
      acct.rating = ratings
      acct.shipping_street = Faker::Address.street_address
      acct.shipping_city = Faker::Address.city
      acct.shipping_state = Faker::Address.state_abbr
      acct.shipping_country = Faker::Address.country
      acct.shipping_postal_code = Faker::Address.zip_code
      acct.shipping_longitude = Faker::Address.longitude
      acct.shipping_latitude = Faker::Address.latitude
      acct.sic_code = sics
      acct.type = account_types
      acct.website = "http://"+Faker::Internet.domain_name
      acct.active = actives
      acct.customer_priority = customer_priorities
      acct.number_of_locations = Faker::Number.positive(from=1, to=200)
      acct.sla = slas
      acct.sla_expiration_date = Faker::Date.between('2015-11-21','2019-04-21')
      acct.sla_serial_number = Faker::Number.positive(1000,9999)
      acct.upsell_opportunity = upsells
      
    end
    
    print "#{num_accounts} created.\n"
  end
  
  desc "Create some fake opportunities using given Account Ids"
  task :fake_opportunities => :environment do
    # prompt for an array of Account Ids
    #print "Enter some validated Account Ids (separated by a space): "
    #accounts = $stdin.gets.split(" ").map { |s| s }
    accounts = ['0011a000001oQseAAE','0011a000001oQsfAAE','0011a000001oQsgAAE']
    # array of valid Opportunity stages
    stages = ['Prospecting', 'Qualification', 'Needs Analysis', 'Value Proposition', 'Id. Decision Makers', 'Perception Analysis', 'Proposal/Price Quote', 'Negotiation/Review', 'Closed Won', 'Closed Lost']
    # array of valid lead sources
    sources = ['Partner Referral', 'Web', 'Phone Inquiry', 'Purchased List','Other']
    # array of valid types
    opptypes = ['Existing Customer - Upgrade','Existing Customer - Replacement','Existing Customer - Downgrade','New Customer']
    # array of valid delivery status
    delivery_status = ['In progress','Yet to begin','Completed']
    # array of valid forecast categories
    forecast_category_names = ['Omitted','Pipeline','Best Case','Commit','Closed']

    # prompt for the number of records to create
    print "How many fake Opportunities do you want? "
    num_opps = $stdin.gets.to_i

    # create the opportunity records
    Opportunity.populate num_opps do |opp|
      opp.account_id = accounts
      opp.name = Faker::Company.name + " " + Faker::Number.between(200000,1000000).to_s
      opp.amount = [50000, 100000, 500000]
      opp.stage = stages
      opp.lead_source = sources
      opp.closed_on = 3.years.ago..Time.now
      opp.order_number = 1000..500000
      opp.o_type = opptypes
      opp.delivery_status = delivery_status
      opp.is_private = 'false'
      opp.forecast_category_name = forecast_category_names

    end
    
    print "#{num_opps} created.\n"
  end

end