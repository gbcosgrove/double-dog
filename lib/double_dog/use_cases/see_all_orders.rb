module DoubleDog
  class SeeAllOrders <SuccessFailure


    def run(params)
      ## Refactor repated failure and succes definitions !!
      return failure(:not_admin) unless admin_session?(params[:admin_session])

      orders = DoubleDog.db.all_orders
      return success(orders: orders)
    end

    def admin_session?(session_id)
      user = DoubleDog.db.get_user_by_session_id(session_id)
      user && user.admin?
    end
  end
end
