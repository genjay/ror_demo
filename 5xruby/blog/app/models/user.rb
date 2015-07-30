class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :posts

	# validates(:name, presence: true, length: {minimum: 3})
	#其實他就只有二個參數，:name 是一個
	# 後面的全是其他，只是省略一些東西，看起來象很多參數
	# validates :email, presence: true 


	# 舊式寫法 
	# validates_presence_of :name, :email, :xx, :yy,:zz
end
