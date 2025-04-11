defmodule Md do
  @moduledoc """
  This converts markdown to html.

  """

  @spec formatGuid(file :: Path.t()) :: String.t()
  def formatGuid(file) do
    file
    |> Path.basename()
    |> String.split(".")
    |> List.first()
    |> String.replace(" ", "-")
  end

  @spec valid_filename?(file :: Path.t()) :: boolean()
  def valid_filename?(file) do
    file_name = Path.basename(file)
    String.starts_with?(file_name, "draft-") && String.ends_with?(file_name, ".md")
  end

  @spec check_markdown_title?(title :: String.t()) :: boolean()
  def check_markdown_title?(nil), do: false

  def check_markdown_title?(title) do
    if String.length(title) > 0 do
      String.starts_with?(title, "#")
    else
      false
    end
  end

  @spec md_to_html(md_string :: String.t()) :: String.t()
  def md_to_html(md_string) do
    {:ok, html} = MDEx.to_html(md_string)
    html
  end

  @spec parse_markdown(article :: Types.Article.t(), config :: Types.Config.t()) ::
          Types.Article.t()
  def parse_markdown(article, config) do
    file_path = Path.join([config.input_folder, article.topic, article.filename])

    case File.read(file_path) do
      {:ok, contents} ->
        lines = String.split(contents, "\n", trim: false)

        {title, body_lines} = extract_title_and_body(lines)

        article = %Types.Article{
          article
          | title: title,
            description: md_to_html(body_lines)
        }

        article

      {:error, reason} ->
        IO.puts("Failed to read file: #{reason}")
        article
    end
  end

  @spec new_article(config :: Types.Config.t(), file :: Path.t(), topic :: Types.Topic.t()) ::
          Types.Article.t() | {:error, Errors.MdError}
  def new_article(config, file, topic) do
    case File.stat(file) do
      {:ok, file_info} ->
        article = %Types.Article{
          filename: file,
          date_published: file_info.time,
          guid: Enum.join([config.link, formatGuid(file)], "/"),
          topic: topic
        }
        parse_markdown(article, config)
      {:error, reason} -> {:error, Errors.MdError, message: reason}
    end
  end

  @spec get_articles(feed :: Types.Feed.t(), topic :: Types.Topic.t()) ::
          {list(Types.Article.t()), Errors.FeedError | nil}
  def get_articles(_feed, _topic) do
  end

  @spec get_topics(feed :: Types.Feed.t()) :: Errors.FeedError | nil
  def get_topics(_feed) do
  end

  @spec from_config(feed :: Types.Feed.t(), config :: Types.Config.t()) ::
          Errors.FeedError | Types.Feed.t() | nil
  def from_config(_feed, _config) do
  end

  defp extract_title_and_body(lines) do
    {title, body} =
      Enum.reduce(lines, {nil, ""}, fn line, {title, body} ->
        cond do
          is_nil(title) and String.starts_with?(line, "# ") ->
            {String.trim_leading(line, "# "), body}

          true ->
            {title, body <> line <> "\n"}
        end
      end)
  end
end
