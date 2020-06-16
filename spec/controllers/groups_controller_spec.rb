# require 'rails_helper'

# RSpec.describe GroupsController, type: :controller do
#   let(:group) { build(:group).attributes }

#   before(:each) do
#     @user = create(:user)
#     log_in @user
#   end

#   describe 'GET Index' do
#     it 'should render index template' do
#       get :index
#       expect(response.status).to eq(200)
#       expect(response).to render_template :index
#     end
#   end

#   describe 'GET New' do
#     it 'should render new template' do
#       get :new
#       expect(response.status).to eq(200)
#       expect(response).to render_template :new
#     end
#   end

#   describe 'GET Show' do
#     it 'should render show template' do
#       group = build(:group, creator_id: @user.id)
#       group.save
#       get :show, params: { id: group.id }
#       expect(response.status).to eq(200)
#       expect(response).to render_template :show
#     end
#   end

#   describe 'POST Create' do
#     it 'should create a new group' do
#       expect do
#         post :create, params: { group: {
#           name: 'New Group',
#           icon: Rails.root.join('spec/support/candy.png'),
#           creator_id: @user.id
#         } }
#       end.to(change { Group.count })
#       expect(response).to redirect_to groups_path
#       expect(response.status).to eq(302)
#       expect(flash[:success]).to be_present
#     end

#     it 'should renders the new template with an invalid name' do
#       expect do
#         post :create, params: { group: {
#           name: '',
#           icon: Rails.root.join('spec/support/candy.png'),
#           creator_id: @user.id
#         } }
#       end.not_to(change { Group.count })
#       expect(response).to render_template :new
#     end

#     it 'should renders the new template with an invalid icon' do
#       expect do
#         post :create, params: { group: {
#           name: 'New Group',
#           icon: '',
#           creator_id: @user.id
#         } }
#       end.not_to(change { Group.count })
#       expect(response).to render_template :new
#     end
#   end
# end
