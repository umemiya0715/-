class Accountdatum < ApplicationRecord
  attribute :user, :string
  attribute :tweets, :string

  def mergeData(user, tweets)
    self.user = user
    self.tweets = tweets
  end
end