defmodule MdTest do
  use ExUnit.Case
  doctest Md

  # TODO add a set up for the directories to be used in the tests (https://hexdocs.pm/ex_unit/main/ExUnit.Callbacks.html#setup/1)

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

    @tag :pending
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

    @tag :pending
    test "get all the articles" do
      # create a temp directory to hold all the articles with sub directories by topic
      {:ok, dir} = Briefly.create(type: :directory)

      # create a sub-directory for the RSS topic
      File.mkdir_p!(Path.join([dir, "RSS"]))

      # Create 2 files in the RSS topic sub-dir
      sub_dir_path = Path.join(dir, "RSS")
      File.write!(Path.join(sub_dir_path, "article1.md"), "# Some title\nThis is body text")
      File.write!(Path.join(sub_dir_path, "article2.md"), "# Some title\nThis is body text")


      config = %Types.Config{
        description: nil,
        input_folder: dir,
        author: nil,
        link: nil,
        output_folder: nil,
        output_file: nil
      }

      # define feed
      feed = %Types.Feed{
        articles: nil,
        config: config,
        topics: nil
      }

      articles = [
        %Types.Article{
          id: nil,
          guid: nil,
          title: "Some title",
          filename: "article1.md",
          date_published: nil,
          description: "<p>This is body text</p>",
          topic: "RSS"
        },
        %Types.Article{
          id: nil,
          guid: nil,
          title: "Some title",
          filename: "article2.md",
          date_published: nil,
          description: "<p>This is body text</p>",
          topic: "RSS"
        }
      ]

      returned_articles = Md.get_articles(feed, "RSS")
      Enum.each(returned_articles, fn article ->
        assert true = Enum.member?(articles, article)
      end)

    end
  end

  @tag :pending
  test "get topics in directory" do

  end

  @tag :pending
  test "from config" do # not sure what this function actually does


  end
end
