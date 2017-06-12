class ContactsController < ApplicationController
    before_action :authenticate_user!

  def index
    @contacts = Contact.all
    @categories = Category.all
  end
end
