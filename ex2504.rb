require 'webrick'
require 'date'

config ={
  Port: 8099,
  DocumentRoot: '.',
}

server = WEBrick::HTTPServer.new(config)

server.mount_proc("/testprog") do |req,res|
  res.body << "<html lang='ja'><meta charset='UTF-8'><body><p>アクセスした日時は、#{Date.today.to_s}です</p>"
  res.body << "<p>リクエストのパスは#{req.path}でした</p>"
  res.body << "<ul>"
  req.each do |key,value|
    res.body << "<li>#{key} : #{value}</li>"
  end
  res.body << "</ul>"
  res.body << "</body></html>"
end

trap(:INT) do
  server.shutdown
end

server.start
