module YoutubeVideoId
  def self.extract(url)
    return '' unless /(?:youtu\.be\/|youtube\.com\/(?:(?:watch)?\?(?:.*&)?v(?:i)?=|(?:embed|v|user)\/))([^\?&\"'>]+)/.match(url)

    # Special case for URLs that look similar to this: https://www.youtube.com/user/SomeChannel#p/a/u/1/YQHsXMglC9A
    if /user/.match(url)
      youtube_video_id = url.strip[-11..-1]
      return self.youtube_video_id_is_valid?(youtube_video_id) ? youtube_video_id : ''
    end

    delimiter = ''
    if /\?v=/.match(url) # There has to be a differentiation between "?v=" and "&v=". See "Test case A"
      delimiter = '?v='
    elsif /&v=/.match(url)
      delimiter = '&v='
    elsif /v\//.match(url)
      delimiter = 'v/'
    elsif /embed/.match(url)
      delimiter = 'embed/'
    elsif /youtu.be/.match(url)
      delimiter = 'youtu.be/'
    else
      return ''
    end

    # Remove everything before the delimiter and the delimiter itself
    # The video ID and possibly some parameters remain.
    # Remove those parameters by selecting the right range of characters
    youtube_video_id = (url.split(delimiter)[1])[0...11]

    self.youtube_video_id_is_valid?(youtube_video_id) ? youtube_video_id : ''
  end

  def self.youtube_video_id_is_valid?(youtube_video_id)
    # Check if the ID can possibly be valid or not (based on length and allowed characters)
    return false if youtube_video_id.length != 11
    /[a-zA-Z0-9_-]{11}/.match(youtube_video_id) ? true : false
  end
end
