require "cgi"

cgi = CGI.new
cgi.out("type" => "text/html", "charset" => "UTF-8") {
    get = cgi['Send']
    "<html>
      <body>
        <p>受け取ったStringは下記になります</p>
        <p>String：#{get}</p>
      </body>
    </html>"
}
