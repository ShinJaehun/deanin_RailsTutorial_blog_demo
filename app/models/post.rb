class Post < ApplicationRecord
  extend FriendlyId

  validates :title, presence: true, length: {minimum: 5, maximum: 50}
  validates :body, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  #has_one_attached :image

  has_rich_text :body
  has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy
  # 이게 문제가 더 이상 @post.body 식으로 접근할 수 없고
  # @post.body.body.to_plain_text 이렇게 해야 본문에 접근할 수 있다.
  # 이를 해결하기 위한 방법

  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user

  def self.ransackable_attributes(auth_object=nil)
    ["title"]
  end
  # 헐 rich_text에 대한 ransackable_associations와
  # ransackable_attributes 설정하는 방법 내가 알아냈따~~
  def self.ransackable_associations(auth_object=nil)
    ["content", "user"]
  end

  ActionText::RichText.class_eval do
    def self.ransackable_attributes(*)
      ["body"]
    end
  end

  friendly_id :title, use: %i[slugged history finders]

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end
end
