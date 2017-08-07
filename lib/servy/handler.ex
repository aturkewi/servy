defmodule Servy.Handler do
  def handle(request) do
    # conv = parse(request)
    # conv = route(conv)
    # format_response(conv)
    
    # lo mismo
    
    request
    |> parse
    |> route
    |> format_response
  end
  
  def parse(request) do
    first_line = request |> String.split("\n") |> List.first
    conv = %{ method: "GET", path: "/wildthings", resp_body: ""}
  end
  
  def route(conv) do
    conv = %{method: "GET", path: "/wildthings", resp_body: "Bears, Lions, Tigers"}
  end
  
  def format_response(conv) do
    """
    HTTP/1.1 200 OK
    Content-Type: text/html
    Content-Length: 20

    Bears, Lions, Tigers
    """
  end
end

request = """
GET /wilthins HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

response = Servy.Handler.handle(request)

IO.puts response