class CommuteParser

  def initialize(csv)
    @csv = csv
  end

  def hashify
    hash = {}
    records = @csv.split("\n")
    records.each do |record|
      datum = record.split(",")
      hash[datum[0]] ||= []
      hash[datum[0]] <<
              {:week => datum[1].to_i,
               :day => datum[2],
               :mode => datum[3],
               :inbound => datum[4].to_i,
               :outbound => datum[5].to_i,
               :distance => datum[6].to_f
              }
    end
    hash
  end

  def data_point(parameter, name, week, day)
    hashify[name].each do |info|
      return info[parameter] if info[:week] == week && info[:day] == day
    end
  end

  def average_total_commutes
    commute_time = 0
    total_commutes = 0
    hashify.each_value do |commute_list|
      commute_list.each do |commute|
        commute_time += commute[:inbound] += commute[:outbound]
        total_commutes += 2
      end
    end
    avg = commute_time/total_commutes.to_f
    avg.round(1)
  end

end