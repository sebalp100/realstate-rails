Searchkick.client = Elasticsearch::Client.new(
  host: ENV.fetch("ELASTICSEARCH_URL") { "http://localhost:9200" },
  transport_options: {
    request: { timeout: 250 }
  }
)
