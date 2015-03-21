RSpec.describe Tohtori::Ping, lita_handler: true do

  it { is_expected.to route_command('ping').to(:ping) }

  it "replies :fish:" do
    send_command('ping')
    expect(replies.last).to be == ':pong:'
  end
end
