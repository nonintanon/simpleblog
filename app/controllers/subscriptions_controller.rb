class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @subscription = current_user.subscriptions.build
    @subscription.subscribable = find_subscribable
    if @subscription.save
      redirect_to @subscription.subscribable
    end
  end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    if @subscription.destroy
      redirect_to @subscription.subscribable
    end
  end

private
  def find_subscribable
    resource, id = request.path.split('/')[1, 2]
    resource.singularize.classify.constantize.find(id)
  end
end