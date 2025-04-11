defmodule MdTest do
  use ExUnit.Case
  doctest Md

  describe "Testing a file parse" do
    test "Converts Markdown to HTML" do
      assert "<h1>This is a title</h1>" == Md.md_to_html("# This is a title")
    end

    test "formats the Guid" do
      {:ok, dir} = Briefly.create(type: :directory)
      File.write(Path.join(dir, "guid file.txt"), "Some text")

      assert "guid-file" == Md.formatGuid(Path.join(dir, "guid file.txt"))
    end

    test "has a valid file name" do
      {:ok, dir} = Briefly.create(type: :directory)
      File.write(Path.join(dir, "draft-guid file.md"), "# Some text")

      assert true == Md.valid_filename?(Path.join(dir, "draft-guid file.md"))
    end

    test "has a invalid file name" do
      {:ok, dir} = Briefly.create(type: :directory)
      File.write(Path.join(dir, "guid file.md"), "# Some text")
      File.write(Path.join(dir, "draft-guid file.txt"), "# Some text")

      assert false == Md.valid_filename?(Path.join(dir, "guid file.md"))
      assert false == Md.valid_filename?(Path.join(dir, "draft-guid file.txt"))
    end

    test "Check markdown title" do
      assert true == Md.check_markdown_title?("# Title")
      assert false == Md.check_markdown_title?("Title")
      assert false == Md.check_markdown_title?("")
    end

    test "Parse the markdown" do
      {:ok, dir} = Briefly.create(type: :directory)

      article = %Types.Article{
        id: nil,
        guid: nil,
        title: nil,
        filename: "article.md",
        date_published: nil,
        description: nil,
        topic: "RSS"
      }

      config = %Types.Config{
        description: nil,
        input_folder: dir,
        author: nil,
        link: nil,
        output_folder: nil,
        output_file: nil
      }

      File.mkdir_p!(Path.join([dir, "RSS"]))
      test_path = Path.join(dir, "RSS/article.md")
      File.write!(test_path, "# Some title\nThis is body text")

      article = Md.parse_markdown(article, config)

      assert "<p>This is body text</p>" == article.description
      assert "Some title" == article.title
    end

    @tag :skip
    test "generate new article" do
      {:ok, dir} = Briefly.create(type: :directory)

      article = %Types.Article{
        id: nil,
        guid: nil,
        title: nil,
        filename: "article.md",
        date_published: nil,
        description: nil,
        topic: "RSS"
      }

      config = %Types.Config{
        description: nil,
        input_folder: dir,
        author: nil,
        link: nil,
        output_folder: nil,
        output_file: nil
      }


    end
  end
end
