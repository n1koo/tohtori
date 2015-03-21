RSpec.describe Tohtori::UnhandledCommand, lita_handler: true do
  it "proposes help when the command didn't match anything" do
    send_command("some crap")
    expect(replies.last).to be == %{Unknown command.\n Try Lita help}
  end

  it "doesn't trigger on arbitrary messages" do
    send_message("some crap")
    expect(replies.last).to be nil
  end
end
