defmodule MdParse do
  @moduledoc """
  This converts markdown to html.

  """

  def formatGuid do
  end

  def valid_filename(_file) do
  end

  def check_markdown_title(title) do
  end

  @spec md_to_html(md_file :: Path.t()) :: String.t()
  def md_to_html(md_file) do
    {:ok, data} = File.read(md_file)
    {:ok, html} = MDEx.to_html(data)
    html
  end

  def parse_markdown do
  end

  def new_article do
  end

  def get_articles do
  end

  def get_topics do
  end

  def from_config do
  end
end
