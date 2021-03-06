require 'twitter'

module T
  module Requestable
    DEFAULT_HOST = 'api.twitter.com'
    DEFAULT_PROTOCOL = 'https'

    def self.included(base)

    private

      def base_url
        "#{protocol}://#{host}"
      end

      def client
        return @client if @client
        @rcfile.path = options['profile'] if options['profile']
        @client = Twitter::Client.new(
          :endpoint => base_url,
          :consumer_key => @rcfile.default_consumer_key,
          :consumer_secret => @rcfile.default_consumer_secret,
          :oauth_token => @rcfile.default_token,
          :oauth_token_secret  => @rcfile.default_secret
        )
      end

      def host
        options['host'] || DEFAULT_HOST
      end

      def protocol
        options['no_ssl'] ? 'http' : DEFAULT_PROTOCOL
      end

    end

  end
end
