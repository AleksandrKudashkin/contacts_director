require 'rails_helper'

describe CategoriesController do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }
  let(:other_user) { create(:user) }
  let(:another_category) { create(:category, user: other_user) }

  before { sign_in(user) }

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Category object' do
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'renders a form for new category' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do
    let(:category_array) { create_list(:category, 3, user: user) }

    before { get :index }

    it 'populates an array of all categories' do
      expect(assigns(:categories)).to match_array(category_array)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: category } }

    it 'assigns the requested category to @category' do
      expect(assigns(:category)).to eq category
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    let(:create_request) { proc { |c| post :create, params: { category: attributes_for(c) } } }

    context 'with valid object' do
      it 'changes the quantity of the Category' do
        expect do
          post :create, params: { category: { name: "MyName", user_id: user.id } }  
        end.to change(Category, :count).by(1)
      end
    end

    context 'with invalid object' do
      it 'not changes count of Categories' do 
        expect { create_request.call(:invalid_category) }.to_not change(Category, :count)
      end

      it 'renders new template' do
        create_request.call(:invalid_category)
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:delete_request) { proc { |q| delete :destroy, params: { id: q } } }

    it 'deletes the category of the user' do
      category
      expect { delete_request.call(category) }.to change(Category, :count).by(-1)
    end

    it 'not deletes the category of the other user' do
      another_category
      expect { delete_request.call(another_category) }.to_not change(Category, :count)
    end
  end

  describe 'PATCH #update' do
    let(:patch_request) do
      proc { |attr, c = category| patch :update, params: { id: c, category: attr } }
    end
    let(:other_subject) { another_category }
    subject { category }

    it "assigns the requested category to @category" do
    patch_request.call(attributes_for(:category))
      expect(assigns(:category)).to eq subject
    end

    it "changes category attributes" do
      patch_request.call({ name: 'New name'} )
      subject.reload
      expect(subject.name).to eq 'New name'
    end

    it "not edites the category of the other user" do
      patch_request.call({ name: 'New name'}, other_subject)
      other_subject.reload
      expect(other_subject.name).to_not eq "New name"
    end
  end
end