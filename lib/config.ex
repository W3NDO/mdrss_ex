defmodule Config do
  @moduledoc """
  This is a submodule for reading config file and using the config object
  """

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
