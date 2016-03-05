require 'webrick'
require 'erb'
require 'dbi'

class String
  alias_method(:orig_concat, :concat)
  def concat(value)
    if RUBY_VERSION > "1.9"
      orig_concat value.force_encoding('UTF-8')
    else
      orig_concat value
    end
  end
end

config = {
  Port: 8099,
  DocumentRoot: '.',
}

WEBrick::HTTPServlet::FileHandler.add_handler("erb", WEBrick::HTTPServlet::ERBHandler)

server = WEBrick::HTTPServer.new(config)

server.config[:MimeTypes]["erb"] = "text/html"

server.mount_proc("/list") do |req,res|
  p req.query
  if /(.*)\.(delete|edit)$/ =~ req.query['operation']
    target_id = $1
    operation = $2
    if operation == 'delete'
      template = ERB.new( File.read('delete.erb') )
    elsif operation == 'edit'
      template = ERB.new( File.read('edit.erb') )
    end
    res.body << template.result(binding)
  else
    template = ERB.new( File.read('noselected.erb') )
    res.body << template.result(binding)
  end
end

trap(:INT) do
  server.shutdown
end

server.start
