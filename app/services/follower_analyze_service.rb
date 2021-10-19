class FollowerAnalyzeService
  include Service

  def initialize(user)
    @user = user
  end

  def call
    follow = @user.friends_count
    follower = @user.followers_count
    f_count = case follower
      when 0..50
        0.1
      when 51..150
        0.2
      when 151..250
        0.3
      when 251..350
        0.4
      when 351..450
        0.5
      when 451..1000
        0.6
      when 1000..1500
        0.7
      when 1500..2000
        0.8
      when 2000..10000
        0.9
      else
        1
      end
    f.ratio = if follow == 0
                if follower > 10
                  1
                else
                  1
                end
              elsif follower / follow.to_f >= 2
                1
              else
                follower / follow.to_f
              end
    follower_point = (f_count * f_ratio).round
    follower_point
  end
end