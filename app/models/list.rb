class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :title, :overview, presence: true, uniqueness: true

  before_destroy :destroy_associated_bookmarks

  private

  def destroy_associated_bookmarks
    bookmarks.destroy_all
  end
end
