defmodule Md do
  @moduledoc """
  This converts markdown to html.

  """

  @spec formatGuid(file :: Path.t()) :: String.t()
  def formatGuid(_file) do
    ""
  end

  @spec valid_filename(file :: Path.t()) :: boolean()
  def valid_filename(_file) do
    false
  end

  @spec check_markdown_title(title :: String.t()) :: boolean()
  def check_markdown_title(_title) do
    false
  end

  @spec md_to_html(md_file :: Path.t()) :: String.t()
  def md_to_html(md_file) do
    {:ok, data} = File.read(md_file)
    {:ok, html} = MDEx.to_html(data)
    html
  end

  @spec parse_markdown(article :: Types.Article.t(), config :: Types.Config.t()) ::
          Types.Article.t()
  def parse_markdown(_article, _config) do
  end

  @spec new_article(config :: Types.Config.t(), file :: Path.t(), topic :: Types.Topic.t()) ::
          Types.Article.t()
  def new_article(_config, _file, _topic) do
  end

  @spec get_articles(feed :: Types.Feed.t(), topic :: Types.Topic.t()) ::
          {list(Types.Article.t()), Errors.FeedError | nil}
  def get_articles(_feed, _topic) do
  end

  @spec get_topics(feed :: Types.Feed.t()) :: Errors.FeedError | nil
  def get_topics(_feed) do
  end

  @spec from_config(feed :: Types.Feed.t(), config :: Types.Config.t()) :: Errors.FeedError | nil
  def from_config(_feed, _config) do
  end
end
