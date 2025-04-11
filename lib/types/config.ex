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

  @spec file_exists?(filename :: Path) :: boolean()
  def file_exists?(_filename) do
    false
  end

  @spec valid?(config :: Types.Config.t()) :: boolean()
  def valid?(_config) do
    false
  end

  @spec read_config(file_path :: Path) :: Types.Config.t() | Error
  def read_config(_file_path) do
    raise Errors.ConfigError, message: "Default error"
  end
end
