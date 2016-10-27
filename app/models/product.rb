class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true#uniqueness: {case_sensitive: false}
#
#   validates :description, presence: true, length: {
#     minimum: 10}
#
  validates :price, presence: true, numericality: {greater_than: 0}

  validates :sale_price, presence: true, numericality: {less_than_or_equal_to: :price}

#
#   def self.search(string)
#     # where(["title ILIKE ? OR description ILIKE ?", '%'+string+'%','%'+string+'%'])
#     # title_find = where(["title ILIKE ?", '%'+string+'%'])
#     # des_find = where(["description ILIKE ?", '%'+string+'%'])
#     where(["title ILIKE ?", '%'+string+'%']).order("title") + where(["description ILIKE ?", '%'+string+'%']).order("description")
#
#   end
#
#   after_initialize :set_default_price
#   before_validation :titleize_t
#
  # after_initialize :set_default_sale_price
  before_validation :set_default_sale_price

    def on_sale?
      self.sale_price < self.price
    end

    def titleize_t
      self.title = title.titleize
    end


   private

   def set_default_sale_price
     self.sale_price ||= self.price
   end

#   def set_default_price
#     self.price ||= 1
#   end

end
