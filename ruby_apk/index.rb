require "webrick"

server = WEBrick::HTTPServer.new({
    :DocumentRoot => ".",
    :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
    :Port => '3000'
})

['INT', 'TERM'].each {|signal|
    Signal.trap(signal){server.shutdown}
}
server.mount("/", WEBrick::HTTPServlet::ERBHandler, 'index.html.erb')
server.mount("/t_data.cgi", WEBrick::HTTPServlet::CGIHandler, 't_data.rb')
server.mount("/f_data.cgi", WEBrick::HTTPServlet::CGIHandler, 'f_data.rb')
server.start