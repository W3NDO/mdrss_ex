defmodule MdParse do
  @moduledoc """
  This converts markdown to html.

  """
  @spec md_to_html(md_file :: Path.t()) :: String.t()
  def md_to_html(md_file) do
    {:ok, data} = File.read(md_file)
    {:ok, html} = MDEx.to_html(data)
    html
  end
end
