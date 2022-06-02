class User < ApplicationRecord

	class EmailValidator < ActiveModel::EachValidator
		def validate_each(record, attribute, value)
			unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
				record.errors.add attribute, (options[:message] || "is not a valid email")
			end
		end
	end

	class PhoneValidator < ActiveModel::EachValidator
		def validate_each(record, attribute, value)
			unless value =~ /^(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}$/
				record.errors.add attribute, (options[:message] || "is not a valid french phone number")
			end
		end
	end

	validates :email, presence: true, uniqueness: true, email: true
	validates :first_name, presence: true, length: {minimum: 3}
	validates :last_name, presence: true, length: {minimum: 3}
	validates :phone, phone: true
end
