require 'commute_parser'

describe "CommuteParser" do
  it "parses CSV into data hash" do
    csv = <<HEREDOC
Emily,4,Monday,Walk,12,15,0.65
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
    }
    expect(actual).to eq(expected)
  end
end
