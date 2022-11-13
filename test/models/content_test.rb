require "test_helper"

class ActionMarkdown::ContentTest < ActiveSupport::TestCase
  test "#to_html converts the Markdown body to HTML" do
    assert_equal %Q(<h1>Title</h1>), ActionMarkdown::Content.new("# Title").to_html.strip
  end

  test "#to_s converts the Markdown body to HTML" do
    assert_equal %Q(<h1>Title</h1>), ActionMarkdown::Content.new("# Title").to_s.strip
  end

  test "#to_s properly sanitizes generated HTML" do
    assert_equal 'alert("hello")', ActionMarkdown::Content.new('<script>alert("hello")</script>').to_s.strip
  end
end
