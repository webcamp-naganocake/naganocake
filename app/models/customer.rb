class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :cart_items, dependent: :destroy
         has_many :orders, dependent: :destroy
         has_many :shipping_addresses, dependent: :destroy

    # 退会機能
    def active_for_authentication?
      super && (self.is_customer_status == false)
    end

       validates :last_name,  presence: true
       validates :first_name, presence: true
       validates :last_name_kana,  presence: true
       validates :first_name_kana, presence: true
       validates :phone_number, presence: true
       validates :postal_code,  presence: true
       validates :address, presence: true
end
