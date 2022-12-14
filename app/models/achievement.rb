# frozen_string_literal: true

class Achievement < ApplicationRecord
     belongs_to :user

     enum category: { study: 0, work: 1, life: 2 }
     
     validates :name, presence: true
     validates :content, presence: true

     def ja_category
          I18n.t("enums.achievement.category.#{category}")
     end
end
