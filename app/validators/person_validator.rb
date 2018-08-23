class PersonValidator < ActiveModel::Validator
	EXPRESSION = /\A[a-zA-Z0-9_.-]+@([a-zA-Z0-9_ -]+\.)+[a-zA-Z]{2,4}\z/
	
	def validate(record)
		return true if record.email.blank? || record.email.match?(EXPRESSION)
		record.errors[:email] << 'deve ser um email válido'
	end
end