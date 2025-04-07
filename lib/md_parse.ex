defmodule MdParse do
  @moduledoc """
  This converts markdown to html.

  ## Examples
    iex> {:ok, file_data} = File.read("../test.md")
    {:ok, "# This is a title\nThis is a paragraph\n\nThis is a paragraph with a [link](https://link.com)"}
    iex> {:ok, html} = MDEx.to_html(file_data)
    {:ok, "<h1>This is a title</h1>\n<p>This is a paragraph</p>\n<p>This is a paragraph with a <a href=\"https://link.com\">link</a></p>"}
  """
  @spec md_to_html(md_file :: Path.t()) :: String.t()
  def md_to_html(md_file) do
    {:ok, data} = File.read(md_file)
    {:ok, html} = MDEx.to_html(data)
    html
  end
end
