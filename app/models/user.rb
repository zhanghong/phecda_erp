class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name,
            :presence => true,
            :uniqueness => true,
            :length => {:within => 3..16}

  ROLES = %w[super_admin admin]
end
