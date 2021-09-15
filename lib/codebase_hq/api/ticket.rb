# frozen_string_literal: true

require 'uri'
require 'codebase_hq/api/base'

module CodebaseHq
  module Api
    class Ticket < Base
      def index(
        project:,
        query: nil
      )
        response = self.class.get("/#{project}/tickets#{query_params(query)}")

        JSON.parse(response.body)
      end

      def create(
        project:,
        ticket:
      )
        response = self.class.post(
          "/#{project}/tickets",
          {
            body: { ticket: ticket } # should include summary & description
          }
        )

        JSON.parse(response.body)
      end

      private

      def query_params(query = nil)
        '?' + URI.encode_www_form({ query: query }) if query
      end
    end
  end
end
