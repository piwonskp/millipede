defmodule GuiWeb.VersionController do
  use GuiWeb, :controller

  def get_version(conn, _params) do
    json conn, %{"version": "Phoenix"}
  end
end
