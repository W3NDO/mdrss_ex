defmodule MdTest do
  use ExUnit.Case
  doctest Md

  describe "Testing a file parse" do
    test "Converts Markdown to HTML" do
      {:ok, path} = Briefly.create()
      File.write!(path, "# This is a title")

      assert "<h1>This is a title</h1>" == Md.md_to_html(path)
    end
  end
end
