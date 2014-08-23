class CommuteParser

  def initialize(csv)
    @csv = csv
  end

  def hashify
    hash = {}
    datum = @csv.split(",")
    hash[datum[0]] =
        [
            {:week => datum[1].to_i,
             :day => datum[2],
             :mode => datum[3],
             :inbound => datum[4].to_i,
             :outbound => datum[5].to_i,
             :distance => datum[6].to_f
            }
        ]
    hash
  end

end