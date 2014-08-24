require 'commute_parser'

describe "CommuteParser" do
  it "parses CSV into data hash" do
    csv = <<HEREDOC
Emily,4,Monday,Walk,12,15,0.65
Gerard,1,Wednesday,Drive,14,12,5
Emily,5,Tuesday,Walk,12,15,0.65
HEREDOC
    commute_parser = CommuteParser.new(csv)
    actual = commute_parser.hashify

    expected = {
        "Emily" => [
            {
                week: 4,
                day: "Monday",
                mode: "Walk",
                inbound: 12,
                outbound: 15,
                distance: 0.65
            },
            {
                week: 5,
                day: "Tuesday",
                mode: "Walk",
                inbound: 12,
                outbound: 15,
                distance: 0.65
            },
        ],
        "Gerard" => [
            {
                week: 1,
                day: "Wednesday",
                mode: "Drive",
                inbound: 14,
                outbound: 12,
                distance: 5
            },

        ],
    }
    expect(actual).to eq(expected)
  end

  it "returns a data point for specified parameter" do
    csv = <<HEREDOC
Emily,4,Monday,Walk,12,15,0.65
Gerard,5,Tuesday,Drive,14,12,5
Emily,5,Wednesday,Drive,10,40,97
Emily,5,Tuesday,Walk,13,15,0.65
HEREDOC

    commute_parser = CommuteParser.new(csv)
    actual = commute_parser.data_point(
        :inbound, "Emily", 5, "Tuesday")
    expected = 13
    expect(actual).to eq(expected)
  end

  it "returns the average time of commutes" do
    csv = <<HEREDOC
Emily,4,Monday,Walk,12,15,0.65
Gerard,5,Tuesday,Drive,14,12,5
Emily,5,Wednesday,Drive,10,40,97
Emily,5,Tuesday,Walk,13,15,0.65
HEREDOC

    commute_parser = CommuteParser.new(csv)
    actual = commute_parser.average_total_commutes
    expected = 16.4
    expect(actual).to eq(expected)
  end
end
