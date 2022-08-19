class JudgeDragonService
  def initialize(score, magnitude, troversion)
    @score = score
    @magnitude = magnitude
    @troversion = troversion
  end

  def call
    if @score >= 0.13 && @magnitude >= 0.57 && @troversion >= 0.37
      dragon_id = 1
    elsif @score >= 0.13 && @magnitude >= 0.57 && @troversion < 0.37
      dragon_id = 2
    elsif @score >= 0.13 && @magnitude < 0.57 && @troversion >= 0.37
      dragon_id = 3
    elsif @score >= 0.13 && @magnitude < 0.57 && @troversion < 0.37
      dragon_id = 4
    elsif @score < 0.13 && @magnitude >= 0.57 && @troversion >= 0.37
      dragon_id = 5
    elsif @score < 0.13 && @magnitude >= 0.57 && @troversion < 0.37
      dragon_id = 6
    elsif @score < 0.13 && @magnitude < 0.57 && @troversion >= 0.37
      dragon_id = 7
    elsif @score < 0.13 && @magnitude < 0.57 && @troversion < 0.37
      dragon_id = 8
    end
  end
end
