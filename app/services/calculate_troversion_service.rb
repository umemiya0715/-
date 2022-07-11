class CalculateTroversionService

  def initialize(target, tweets)
    @target = target
    @tweets = tweets
  end

  def call
    resultFavorites = []
    resultRetweets = []
    @tweets.each do |tweet|
      resultFavorites.push(tweet.favorite_count)
      resultRetweets.push(tweet.retweet_count)
    end
    replyCounts = 16 - @tweets.count
    # ツイート頻度
    firstTweetDifference = (Time.now - @tweets.last.created_at) / ( 60 * 60 * 24)
    tweetFrequency = @tweets.count / firstTweetDifference.floor(2)
    if tweetFrequency <= 3
      userFrequency = tweetFrequency / 3 * 0.2
    elsif
      userFrequency = 0.2
    end
    # リプライ数
    if replyCounts < 8
      replyRate = replyCounts * 2 / 16 * 0.2
    elsif
      replyRate = 0.2
    end
    # いいね数
    averageFavorites = resultFavorites.sum(0.0) / resultFavorites.size
    if averageFavorites <= ( @target.followers_count * 0.05 )
      userFavorites = averageFavorites / ( @target.followers_count * 0.05 ) * 0.2
    elsif
      userFavorites = 0.2
    end
    # フォロワー数
    if @target.followers_count <= 1000
      userFollowers = @target.followers_count / 1000 * 0.2
    elsif
      userFollowers = 0.2
    end
    # リツイート数
    if resultRetweets.max <= 100
      userRetweets = resultRetweets.max / 100 * 0.2
    elsif
      userRetweets = 0.2
    end
    troversion = ( userFrequency + replyRate + userFavorites + userFollowers + userRetweets ).floor(2)
  end
end