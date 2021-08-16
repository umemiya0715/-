class AnalyzedData < ApplicationRecord
  def emotionAnalyze
    emotion = emotionAnalyzeService.call
    result = DragonJudgeService.call(troversion,polarity, magnitude)
  end
end