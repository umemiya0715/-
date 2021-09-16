class Accountdatum < ApplicationRecord
  attribute :user, :string
  attribute :tweet, :string

  def mergeData(user, tweets)
    self.user = user
    self.tweet = tweets
  end
end