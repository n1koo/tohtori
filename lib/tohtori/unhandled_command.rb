module Tohtori
  class UnhandledCommand < Lita::Handler
    on :unhandled_message, :help

    def help(message:, **kwargs)
      return unless message.command?
      robot.send_message(message.source, "Unknown command.\n Try #{robot.mention_name} help")
    end
  end
  Lita.register_handler(UnhandledCommand)
end
