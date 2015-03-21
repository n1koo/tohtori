module Tohtori
  class Ping < Lita::Handler
    route /^ping$/, :ping, command: true, help: { 'ping' => 'Reply with pong' }

    def ping(response)
      response.reply(':pong:')
    end
  end
  Lita.register_handler(Ping)
end
