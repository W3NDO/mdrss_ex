defmodule Mdrss do
  @moduledoc """
  Contains the control logic of mdrss. Parses config/arguments, and calls the required function (update/ls) from the mdrss module.
  """

  @spec ls(config :: Types.Config.t()) :: Errors.FeedError | nil
  def ls(_config) do
  end

  @spec update(config :: Types.Config.t()) :: Errors.FeedError | nil
  def update(_config) do
  end

  @spec parse(command :: String.t(), config :: Types.Config.t()) :: Errors.FeedError | nil
  def parse(_command, _config) do
  end

  def main do
  end
end
