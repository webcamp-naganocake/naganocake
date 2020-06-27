class Admins::TopController < ApplicationController
	before_action :authenticate_admin!
  def top
    @orders = Order.where("created_at" === Date.today)
    #whereは与えられた条件にマッチするレコードを全て返す
    #今回は今日来た注文の日をマッチさせている
    #参考URLはこれhttps://easyramble.com/get-today-record-with-rails-activerecord.html
  end
end
