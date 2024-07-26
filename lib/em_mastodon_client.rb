# lib/em_mastodon_client.rb
require "mastodon"
require "eventmachine"

class EMMastodonClient
  def initialize(base_url, access_token)
    @client = Mastodon::REST::Client.new(base_url: base_url, bearer_token: access_token)
  end

  def post_status_async(status, &callback)
    EM.run do
      EM.defer do
        response = @client.create_status(status)
        EM.stop
        callback.call(response) if callback
      end
    end
  end
end

