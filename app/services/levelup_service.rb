class LevelupService
  def initialize(level)
    @level = level
  end

  def call
    former_level = @level.current_level
    if @level.leveluped_at.nil? || (@level.leveluped_at.to_date.before? Date.today)
      @level.leveluped_at = Date.today
      @level.experience += 1
    end
    case @level.experience
    when 0 .. 2
      @level.current_level = 1
    when 3 .. 6
      @level.current_level = 2
    when 7 .. 13
      @level.current_level = 3
    else
      @level.current_level = 4
    end
    if former_level != @level.current_level
      @level.setting_level = @level.current_level
    end
  end
end
