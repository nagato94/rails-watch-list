class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates :movies, uniqueness: {scope: :list, message: 'already bookmarked in this list'}
end
