defmodule Xml do
  @moduledoc """
  This module is responsible for writing RSS compliant XML.to_xml/1 is called by the main control flow with a feed object. the remaining functions add the header and the item strings and write the XML to the file system.
  """

  @spec create_filename(config :: Types.Config.t(), topic :: Types.Topic.t()) :: String.t()
  def create_filename(_config, _topic) do
    ""
  end

  @spec add_item(
          xml_content :: String.t(),
          config :: Types.Config.t(),
          article :: Types.Article.t()
        ) :: String.t()
  def add_item(_xml_content, _config, _article) do
    ""
  end

  @spec add_header(config :: Types.Config.t()) :: String.t()
  def add_header(_config) do
    ""
  end

  # The specification for this needs a bit more clarity.
  @spec create_rss_feed(feed :: Types.Feed.t(), topic :: Types.Topic.t()) :: binary()
  def create_rss_feed(_feed, _topic) do
  end

  @spec to_xml(feed :: Types.Feed.t()) :: {:ok, Sting.t()} | {:error, Errors.XmlError}
  def to_xml(_feed) do
  end
end
