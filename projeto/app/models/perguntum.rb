class Perguntum < ApplicationRecord
    has_many :respostum
    belongs_to :user
end
