class CalculateTroversionService
  def initialize(target, tweets)
    @target = target
    @tweets = tweets
  end

  def call
    result_favorites = []
    result_retweets = []
    @tweets.each do |tweet|
      result_favorites.push(tweet.favorite_count)
      result_retweets.push(tweet.retweet_count)
    end
    reply_counts = 16 - @tweets.count
    # ツイート頻度
    first_tweet_difference = (Time.current - @tweets.last.created_at) / (60 * 60 * 24)
    tweet_frequency = @tweets.count / first_tweet_difference.floor(2)
    if tweet_frequency <= 3
      user_frequency = tweet_frequency / 3 * 0.2
    else
      user_frequency = 0.2
    end
    # リプライ数
    if reply_counts < 8
      reply_rate = reply_counts * 2 / 16 * 0.2
    else
      reply_rate = 0.2
    end
    # いいね数
    average_favorites = result_favorites.sum(0.0) / result_favorites.size
    if average_favorites <= (@target.followers_count * 0.05)
      user_favorites = average_favorites / (@target.followers_count * 0.05) * 0.2
    else
      user_favorites = 0.2
    end
    # フォロワー数
    if @target.followers_count <= 1000
      user_followers = @target.followers_count / 1000 * 0.2
    else
      user_followers = 0.2
    end
    # リツイート数
    if result_retweets.max <= 100
      user_retweets = result_retweets.max / 100 * 0.2
    else
      user_retweets = 0.2
    end
    troversion = (user_frequency + reply_rate + user_favorites + user_followers + user_retweets).floor(2)
  end
end
