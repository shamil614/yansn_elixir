defmodule App.SocialNetwork.PageController do
  use App.SocialNetwork.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
