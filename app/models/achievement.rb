class Achievement < ApplicationRecord
     belongs_to :user
     
     enum category: { study: 0, work: 1, life: 2 }
end
