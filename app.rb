require "sinatra"

set :bind, "0.0.0.0"
set :port, ENV.fetch("PORT", 3000)

get "/" do
  check_result = "<span style='color:red'> Try the magic word \"caleb\"</span>"

  <<~HTML
    <!DOCTYPE html>
    <html>
    <head>
      <title>rubyisbad</title>
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

post "/" do
  input = params["myText01"]
  if input == "caleb"
    check_result = "<b style='color:green'> Cool! </b>"
  else
    check_result = "<span style='color:red'> Try the magic word \"caleb\"</span>"
  end

  <<~HTML
    <!DOCTYPE html>
    <html>
    <head>
      <title>rubyisbad</title>
    </head>
    <body>
      <h3 align=center>Render-ruby-backend</h3>
      <form action="/" method="post">
        <label for="myText01">Enter Text:</label>
        <input type="text" id="myText01" name="myText01" value="#{input}">
        <input type="submit" value="Submit">
      </form>
      #{check_result}
    </body>
    </html>
  HTML
end
