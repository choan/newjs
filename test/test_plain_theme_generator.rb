require File.join(File.dirname(__FILE__), "test_generator_helper.rb")

class TestPlainThemeGenerator < Test::Unit::TestCase
  include RubiGen::GeneratorTestHelper

  def setup
    bare_setup
  end
  
  def teardown
    bare_teardown
  end
  
  def test_generator_without_options
    run_generator('plain_theme', [], sources)
    %w[template.rhtml stylesheets/screen.css javascripts/rounded_corners_lite.inc.js].each do |file|
      assert_generated_file("website/#{file}")
    end
  end
  
  def test_generator_with_author_and_email
    run_generator('plain_theme', [], sources, {:author => "AUTHOR", :email => "EMAIL"})
    %w[template.rhtml stylesheets/screen.css javascripts/rounded_corners_lite.inc.js].each do |file|
      assert_generated_file("website/#{file}")
    end
  end
  
  private
  def sources
    [RubiGen::PathSource.new(:test, File.join(File.dirname(__FILE__),"..", generator_path))
    ]
  end
  
  def generator_path
    "newgem_theme_generators"
  end
end
