class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
    @categories = Category.all
  end

  def show
  end

  def new
    @contact = Contact.new(user: current_user)
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.user_id == current_user.id && @contact.save
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def update
    if @contact.user_id == current_user.id && @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private
    def set_category
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(
        :first_name,
        :last_name,
        :phone,
        :email,
        :user_id,
        :category_id,
        image_attributes: [:id, :file, :_destroy]
        )
    end
end
