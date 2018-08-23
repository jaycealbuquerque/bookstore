class Person < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
	validates_with PersonValidator
	validates :email, allow_blank: true, allow_nil: true, uniqueness: true,
	email: { message: 'está com um formato maluco' }
	validates :born_at, presence: true
	validate :age_limit

	private
	def age_limit
	  if self.born_at.nil? || Date.current.year - self.born_at.year < 16
	  errors.add(:born_at, 'tem que ser maior que 16 anos')
	  throw(:abort)
	  end
	end
end
