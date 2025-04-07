defmodule Types.Feed do
  @type t :: %__MODULE__{
          articles: list(Types.Article.t()),
          config: Types.Config.t(),
          topics: list(Types.Topic.t())
        }

  defstruct articles: nil,
            config: nil,
            topics: nil
end
