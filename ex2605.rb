require 'webrick'

config ={
  Port: 8099,
  DocumentRoot: '.',
}

WEBrick::HTTPServlet::FileHandler.add_handler("erb", WEBrick::HTTPServlet::ERBHandler)

server = WEBrick::HTTPServer.new(config)

server.config[:MimeTypes]["erb"] = "text/html"

trap(:INT) do
  server.shutdown
end

server.start
