class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  validate :check_for_bookmarks_before_destroy

  private

  def check_for_bookmarks_before_destroy
    if bookmarks.any?
      errors.add(:base, "cannot delete movie with associated bookmarks")
    end
  end
end
