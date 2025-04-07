defmodule Types.Config do
  @type t :: %__MODULE__{
          description: String.t(),
          input_folder: String.t(),
          author: String.t(),
          link: String.t(),
          output_folder: String.t() | nil,
          output_file: String.t() | nil
        }

  defstruct description: nil,
            input_folder: nil,
            author: nil,
            link: nil,
            output_folder: nil,
            output_file: nil
end
