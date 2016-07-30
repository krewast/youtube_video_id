require 'test/unit'
require_relative '../lib/youtube_video_id/youtube_video_id_extractor.rb'

class TCYoutubeVideoIdExtractor < Test::Unit::TestCase
  def test_extract
    # Try different things:
    # - Formats (v=, v, embed, ...)
    # - With or without protocol (//, http, https)
    # - With or without whitespaces
    # - With or without parameters
    # - Mobile
    # - Certain special cases

    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('youtube.com/watch?v=YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('//www.youtube.com/watch?v=YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('http://www.youtube.com/watch?v=YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://www.youtube.com/watch?v=YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('   https://www.youtube.com/watch?v=YQHsXMglC9A   '))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://www.youtube.com/watch?v=YQHsXMglC9A&feature=youtu.be'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://www.youtube.com/watch?feature=youtu.be&v=YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://www.youtube.com/watch?v=YQHsXMglC9A#t=0m10s'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://m.youtube.com/watch?v=YQHsXMglC9A'))

    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('youtube.com/v/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('//www.youtube.com/v/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('http://www.youtube.com/v/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://www.youtube.com/v/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('   https://www.youtube.com/v/YQHsXMglC9A   '))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://www.youtube.com/v/YQHsXMglC9A?feature=youtu.be'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://www.youtube.com/v/YQHsXMglC9A#t=0m10s'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://m.youtube.com/v/YQHsXMglC9A'))

    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('youtube.com/embed/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('//www.youtube.com/embed/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('http://www.youtube.com/embed/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://www.youtube.com/embed/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('   https://www.youtube.com/embed/YQHsXMglC9A   '))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://www.youtube.com/embed/YQHsXMglC9A?feature=youtu.be'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://www.youtube.com/embed/YQHsXMglC9A#t=0m10s'))

    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('youtu.be/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('//youtu.be/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('http://youtu.be/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://youtu.be/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('   https://youtu.be/YQHsXMglC9A   '))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://youtu.be/YQHsXMglC9A?feature=youtu.be'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://youtu.be/YQHsXMglC9A#t=0m10s'))

    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('youtube.com/user/SomeChannel#p/a/u/1/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('//www.youtube.com/user/SomeChannel#p/a/u/1/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('http://www.youtube.com/user/SomeChannel#p/a/u/1/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://www.youtube.com/user/SomeChannel#p/a/u/1/YQHsXMglC9A'))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('   https://www.youtube.com/user/SomeChannel#p/a/u/1/YQHsXMglC9A   '))
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('https://m.youtube.com/user/SomeChannel#p/a/u/1/YQHsXMglC9A'))

    # Test case A:
    assert_equal('YQHsXMglC9A', YoutubeVideoId.extract('http://www.youtube.com/watch?argv=xyzxyzxyzxy&v=YQHsXMglC9A'))
  end

  def test_youtube_video_id_is_valid?
    assert_equal(true,  YoutubeVideoId.youtube_video_id_is_valid?('YQHsXMglC9A'))  # Original
    assert_equal(true,  YoutubeVideoId.youtube_video_id_is_valid?('YQH-XMglC9A'))  # Hyphen
    assert_equal(true,  YoutubeVideoId.youtube_video_id_is_valid?('YQH_XMglC9A'))  # Underscore
    assert_equal(true,  YoutubeVideoId.youtube_video_id_is_valid?('YQHsXMglC0A'))  # Different number

    assert_equal(false, YoutubeVideoId.youtube_video_id_is_valid?('YQHsXMglC9'))   # Too short
    assert_equal(false, YoutubeVideoId.youtube_video_id_is_valid?('YQHsXMglC9AB')) # Too long
    assert_equal(false, YoutubeVideoId.youtube_video_id_is_valid?('YQH*XMglC9A'))  # Invalid character
  end
end
