defmodule GuiWeb.PageController do
  use GuiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
