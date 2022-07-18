class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, {length: {minimum: 250}}
    validates :summary, {length: {maximum: 250}}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title, :title_clickbait_validator


    def title_clickbait_validator
        if title && !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top 10") && !title.include?("Guess")
            errors.add(:title, "not clickbaity-y enough")
        end
    end

end
