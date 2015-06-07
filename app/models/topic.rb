class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :publicly_viewable, -> { where(public: true) }
  scope :privately_viewable, -> { where(public: false) }
  scope :visible_to, -> (user) { user ? all : publicly_viewable }
end
