class User < ApplicationRecord
	has_many :articles       #one to many  association 

	before_save { self.email= email.downcase }  #self each obj of user classs
	validates :username, presence: true,
					     uniqueness: {case_sensitive: false},
						 length: {minimum:4, maximum:10}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, 
					length: { maximum: 100 },
					format:{ with: VALID_EMAIL_REGEX }
	has_secure_password   #pass. take as hashing algo system
	has_secure_password :recovery_password, validations: false

end
