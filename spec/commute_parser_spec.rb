require 'commute_parser'

describe "CommuteParser" do
  it "parses CSV into data hash" do
    csv = <<HEREDOC
Emily,4,Monday,Walk,12,15,0.65
Gerard,1,Wednesday,Drive,14,12,5
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
end
