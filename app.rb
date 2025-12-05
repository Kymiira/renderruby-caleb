require 'sinatra'

set :bind, '0.0.0.0'
set :port, ENV['PORT'] || 3000

get '/' do
  check_result = "<span style='color:red'> Try the magic word \"caleb\"</span>"

  <<-HTML
  <!DOCTYPE html>
  <html>
  <head>
      <title>rubyisgood</title>
  </head>
  <body>
      <h3 align=center>Render-ruby-backend</h3>
      <form action="/" method="post">
          <label for="myText01">Enter Text:</label>
          <input type="text" id="myText01" name="myText01" value="caleb">
          <input type="submit" value="Submit">
      </form>
      #{check_result}
  </body>
  </html>
  HTML
end

post '/' do
  input = params["myText01"]
  check = input == "caleb"

  if check
    check_result = "<b style='color:green'> Cool! </b>"
  else
    check_result = "<span style='color:red'> Try the magic word \"caleb\"</span>"
  end

  <<-HTML
  <!DOCTYPE html>
  <html>
  <head>
      <title>rubyisgood</title>
  </head>
  <body>
      <h3 align=center>ruby-backend - t2a27-render-ruby-caleb</h3>
      <form action="/" method="post">
          <label for="myText01">Enter Text:</label>
          <input type="text" id="myText01" name="myText01" value="caleb">
          <input type="submit" value="Submit">
      </form>
      #{check_result}
  </body>
  </html>
  HTML
end
