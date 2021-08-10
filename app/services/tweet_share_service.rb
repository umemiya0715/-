class TweetShareService
  include Service

  def initialize(name, result, screen_name = nil)
    @result = result
    @name = name
    @screen_name = screen_name
  end

  def call
    if @screen_name
      text = "text=#{@name.truncate(15)さん(@#{@screen_name})"
    else
      text = "text=#{@name.truncate(18)}さん"
    end
    share_tweet = URI.encode(
      "https//twitter.com/intent/tweet?" +
      text
      "&url=https://app.com/"
    )
    share_tweet
  end
end