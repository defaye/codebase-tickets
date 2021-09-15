# frozen_string_literal: true

module CodebaseHq
  module Api
    class Base
      include HTTParty
      base_uri 'https://api3.codebasehq.com/'
      headers content_type: 'application/json',
              accept: 'application/json'

      def initialize(
        username:,
        password:
      )
        self.class.basic_auth(username, password)
      end
    end
  end
end
