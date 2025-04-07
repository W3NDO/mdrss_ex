defmodule Types.Article do
  @type t :: %__MODULE__{
          id: integer(),
          guid: String.t(),
          title: String.t(),
          filename: String.t(),
          date_published: DateTime.t(),
          description: String.t(),
          topic: Topic.t() | nil
        }

  defstruct id: nil,
            guid: nil,
            title: nil,
            filename: nil,
            date_published: nil,
            description: nil,
            topic: nil
end
