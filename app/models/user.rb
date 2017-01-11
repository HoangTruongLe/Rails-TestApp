class User < ActiveRecord::Base
    has_many :articles, dependent: :destroy
    before_save {self.email = email.downcase}
    validates :username, presence:true, 
                uniqueness: { case_sensitive:false }, 
                length:{minimum:6,maximum:30}
    VALID_EMAIL_REGEX= /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, 
                presence:true,           
                uniqueness: { case_sensitive:false }, 
                length: { minimum:6, maximum:30 } ,
                format: { with: VALID_EMAIL_REGEX }
    validates :password, 
                presence:true,           
                length: { minimum:6, maximum:30 }
    has_secure_password
end