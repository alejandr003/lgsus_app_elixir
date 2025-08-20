defmodule LgsusAppWeb.PageController do
  use LgsusAppWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
