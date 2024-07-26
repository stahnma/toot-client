#!/usr/bin/env ruby

# example.rb
require_relative "lib/em_mastodon_client"

access_token = ENV["MC_ACCESS_TOKEN"]

client = EMMastodonClient.new("https://mastodon.social", access_token)

# Take message from command line, if that's not there, fallback to default message
message = ARGV[0] || "Hello Mastodon from a ruby client powered by Flox!"

client.post_status_async(message) do |response|
	uri = response.uri
	puts "Toot posted! URI: #{uri}"
end
