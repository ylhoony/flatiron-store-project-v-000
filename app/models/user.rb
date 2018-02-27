class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :orders
  has_many :items, through: :orders

  belongs_to :current_cart, class_name: "Cart", foreign_key: "current_cart_id"

  def remove_current_cart
    self.current_cart = nil
    self.save
  end

  def create_current_cart
    new_cart = carts.create
    new_cart.user = self
    self.current_cart = new_cart
    self.save
  end

end
