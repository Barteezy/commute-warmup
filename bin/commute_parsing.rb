require '../lib/commute_parser'

data = File.read("../data/gschool_commute_data.csv")
commute_parser = CommuteParser.new(data)

p "* For Week 4 on Wednesday, what was Nate's inbound commute time?"
p commute_parser.data_point(:inbound, "Nate", 4, "Wednesday")
p "*"*30
p "* For all 5 weeks, what was the group average commute time?"
p commute_parser.average_total_commutes
