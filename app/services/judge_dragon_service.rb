class JudgeDragonService

  def initialize(score, magnitude, troversion)
    @score = score
    @magnitude = magnitude
    @troversion = troversion
  end

  def call
    if @score >= 0.13 and @magnitude >= 0.57 and @troversion >= 0.37
      dragonId = 1
    elsif @score >= 0.13 and @magnitude >= 0.57 and @troversion < 0.37
      dragonId = 2
    elsif @score >= 0.13 and @magnitude < 0.57 and @troversion >= 0.37
      dragonId = 3
    elsif @score >= 0.13 and @magnitude < 0.57 and @troversion < 0.37
      dragonId = 4
    elsif @score < 0.13 and @magnitude >= 0.57 and @troversion >= 0.37
      dragonId = 5
    elsif @score < 0.13 and @magnitude >= 0.57 and @troversion < 0.37
      dragonId = 6
    elsif @score < 0.13 and @magnitude < 0.57 and @troversion >= 0.37
      dragonId = 7
    elsif @score < 0.13 and @magnitude < 0.57 and @troversion < 0.37
      dragonId = 8
    end
  end
end