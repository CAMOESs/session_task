class User < ApplicationRecord

    has_secure_password
    validates :name, 
        format:{with:/\A[a-zA-Z0-9_]{3,20}\z/,message:'contient que des alpha numérique et _'},
        uniqueness: {case_sensitive: false}
        validates :email, 
        format:{with:/\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/},
        uniqueness: {case_sensitive: false}

    validates_length_of :password_digest, minimum: 6, message: 'please enter at least 6 characters'
    has_many :tasks, dependent: :destroy

end
