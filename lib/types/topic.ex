defmodule Types.Topic do
  @type t :: %__MODULE__{
          data: list(String.t())
        }

  defstruct data: nil
end
