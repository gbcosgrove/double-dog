require 'active_record'
# require 'sqlite3'
require 'pry'

module DoubleDog
  module Database
    class SQLiteDatabase

      def clear_all
        User.delete_all
        Item.delete_all
        Order.delete_all
      end

      def initialize
        ActiveRecord::Base.establish_connection(
          :adapter => 'sqlite3',
          :database => 'double-dog_test'
          )
      end

      class User < ActiveRecord::Base
        has_many :orders
        has_many :items, through: :orders
      end

      class Order < ActiveRecord::Base
        belongs_to :user
        has_many :items
      end

      class Item < ActiveRecord::Base
        belongs_to :order
      end

      class Session < ActiveRecord::Base
        belongs_to :user
      end

      def build_user(attrs)
        DoubleDog::User.new(attrs[:id], attrs[:username], attrs[:password], attrs[:admin])
      end

      def create_user(attrs)
        ar_user = User.create(attrs)
        build_user(ar_user)
      end

      def get_user(id)
        user = User.find_by(id: id)
        build_user(user)
      end

      def build_session
        DoubleDog::Session.new()
      end

      def create_session(attrs)

      end

      def get_user_by_session_id(sid)
        ar_session = Session.find_by(id: sid)
        ar_user = {id: ar_session[:user_id]}
        build_user(ar_user)
      end

      def get_user_by_username(username)
        ar_user = User.find_by(username: username)
        build_user(ar_user)
      end

      def build_item(attrs)
        DoubleDog::Item.new(attrs[:id], attrs[:name], attrs[:price])
      end

      def create_item(attrs)
        ar_item = Item.create(attrs)
        build_item(ar_item)
      end

      def all_items
        ar_item = Item.all
        build_item(ar_item)
      end

      def get_item(id)
        ar_item = Item.find_by(id: id)
        build_item(ar_item)
      end

      def build_order(attrs)
        DoubleDog::Order.new(attrs[:id], attrs[:employee_id], attrs[:item_id])
      end

      def create_order(attr)
        ar_order = Order.create(attr)
        build_order(ar_order)
      end

      def get_order(id)
        ar_order = Order.find_by(id: id)
        build_order(ar_order)
      end

      def all_orders
        ar_order = Orders.all
        build_order(ar_order)
      end
    end
  end
end

