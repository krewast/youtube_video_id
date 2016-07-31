# youtube_video_id

[![Gem Version](https://badge.fury.io/rb/youtube_video_id.svg)](https://badge.fury.io/rb/youtube_video_id)
[![Build Status](https://travis-ci.org/krewast/youtube_video_id.svg?branch=master)](https://travis-ci.org/krewast/youtube_video_id)
[![Code Climate](https://codeclimate.com/github/krewast/youtube_video_id/badges/gpa.svg)](https://codeclimate.com/github/krewast/youtube_video_id)

This gem makes it easy to extract the YouTube video ID from a YouTube video url.

These urls come in various forms and it is not exactly trivial to get the video ID out of them. This is where this gem comes in.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'youtube_video_id'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install youtube_video_id


## Usage

At first, don't forget to require the gem in your script or project after the installation.

    require 'youtube_video_id'

### Extract the YouTube video ID

If you have any YouTube url you can simply extract the video ID (if there is a valid one) with the "extract" method:

```ruby
YoutubeVideoId.extract('https://www.youtube.com/watch?v=YQHsXMglC9A') # => 'YQHsXMglC9A'
YoutubeVideoId.extract('https://www.youtube.com/watch?v=YQHsXMg')     # => '' (ID too short and therefore not valid)
```

The method supports urls in these formats:

    https://www.youtube.com/watch?v=YQHsXMglC9A
    https://www.youtube.com/v/YQHsXMglC9A
    https://www.youtube.com/embed/YQHsXMglC9A
    https://www.youtube.com/user/SomeChannel#p/a/u/1/YQHsXMglC9A
    https://youtu.be/YQHsXMglC9A
    https://m.youtube.com/watch?v=YQHsXMglC9A
    https://m.youtube.com/v/YQHsXMglC9A

Additional parameters or fragment identifiers don't matter. The method knows how to handle those:

    https://www.youtube.com/watch?v=YQHsXMglC9A&feature=youtu.be
    https://www.youtube.com/watch?feature=youtu.be&v=YQHsXMglC9A
    https://www.youtube.com/watch?v=YQHsXMglC9A#t=0m15s

It's also not important whether a the url contains information about the protocol or not. The extract methods works with all variants:

    youtube.com/watch?v=YQHsXMglC9A
    //www.youtube.com/watch?v=YQHsXMglC9A
    http://www.youtube.com/watch?v=YQHsXMglC9A
    https://www.youtube.com/watch?v=YQHsXMglC9A

### Check whether a given YouTube video ID is valid

If you already have a string and want to check whether it could be a YouTube video ID you can use the method called 'youtube_video_id_is_valid?'. It returns either true or false:

```ruby
YoutubeVideoId.youtube_video_id_is_valid?('YQHsXMglC9A') # => true
YoutubeVideoId.youtube_video_id_is_valid?('YQHsXMg')     # => false (ID too short and therefore not valid)
```

Please note that this method doesn't "really" check if an ID is valid in the sense that there actually EXISTS a video with this ID. Instead, the method checks if the given video ID "looks right" and could possibly be a valid Youtube video ID.

If you want to make sure whether there actually is a video for a given ID you'll have to consult the [YouTube API](https://developers.google.com/youtube/v3/docs/videos).


## Contributing

If you have any valid urls that link to a YouTube video but for some reason don't work with this gem I would be happy to be notified! 

Bug reports and pull requests are welcome on GitHub at https://github.com/krewast/youtube_video_id. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
