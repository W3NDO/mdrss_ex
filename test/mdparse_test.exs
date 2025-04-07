defmodule MdparseTest do
  use ExUnit.Case
  doctest MdParse

  describe "Testing a file parse" do
    test "Converts Markdown to HTML" do
      {:ok, path} = Briefly.create()
      File.write!(path, "# This is a title")

      assert "<h1>This is a title</h1>" == MdParse.md_to_html(path)
    end
  end
end
