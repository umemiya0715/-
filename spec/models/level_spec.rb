# == Schema Information
#
# Table name: levels
#
#  id            :bigint           not null, primary key
#  current_level :integer          default(1), not null
#  experience    :integer          default(0), not null
#  setting_level :integer          default(1), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_levels_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Level, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
