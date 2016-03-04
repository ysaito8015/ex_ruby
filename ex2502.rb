require 'webrick'

config ={
  Port: 8099,
  DocumentRoot: '.',
}

server = WEBrick::HTTPServer.new(config)

trap(:INT) do
  server.shutdown
end

server.start
