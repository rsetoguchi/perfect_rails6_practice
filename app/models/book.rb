class Book < ApplicationRecord
  scope :costly, -> { where('price > ?', 3000) }
  scope :wirtten_about, ->(theme) { where('name like ?', "%#{theme}%") }

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # 独自のバリデーション
  validate { |book| book.errors[:name] << "I don't like exercise." if book.name.include?('exercise') }

  # コールバック
  before_validation :add_lovely_to_cat
  after_destroy { Rails.logger.info "Book is deleted: #{self.attributes}" }
  # 価格が5000円以上のBookをdestroyした場合に、警告のログが吐き出されるようにするコールバック
  after_destroy :if => :high_price? do
    Rails.logger.warn "Book with high price is deleted: #{self.attributes}"
    Rails.logger.warn 'Please check!!'
  end

  private

  # 本の名前を保存する前
  # 名前に「Cat」が含まれていた場合、「Lovely Cat」という文字に置き換える
  def add_lovely_to_cat
    self.name = self.name.gsub(/Cat/) { |matched| "Lovely #{matched}" }
  end

  def high_price?
    price >= 5000
  end
end
