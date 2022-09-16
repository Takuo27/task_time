class Task < ApplicationRecord
    belongs_to :user
    
    enum category: { study: 0, work: 1, life: 2 }
    enum status: { waiting: 0, doing: 1, finished: 2 }
end
