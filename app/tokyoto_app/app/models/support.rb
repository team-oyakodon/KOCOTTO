class Support < ApplicationRecord
  has_many :conditions_supports, dependent: :destroy
  has_many :supports_tags
  has_many :tags, through: :supports_tags

  validates :support_name, presence: true, uniqueness: true
  validates :content, presence: true
  validates :publish_state, presence: true

  enum publish_state: { draft: 0, published: 1, publish_wait: 2 }

  scope :by_tag, ->(tag_id) { joins(:tags).where(supports_tags: { tag_id: tag_id }) }
  scope :support_name_contain, ->(support_name) { where('support_name LIKE ?', "%#{support_name}%") }
  scope :state_contain, ->(state) { where(state: state) }
end
