module Ruboty
  module Handlers
    class Repeat < Base
      on(
        /\d+ times/,
        name: 'repeat',
        description: 'repeat action n times'
      )

      def repeat(message)
        n   = message.body.match(/\d+/).to_s.to_i
        msg = message.body.sub(/\d+ times /, '')

        return if n.nil?
        return if msg.empty?
        return if msg.match(/\d+ times /)

        n.times do
          robot.receive(
            message.original.merge(body: msg)
          )
        end
      end
    end
  end
end
