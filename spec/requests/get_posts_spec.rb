
require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:post, 10)
      let!(:user) { FactoryBot.create(:user) }
      get "/users/#{user.id}/posts"
    end
    
    it 'returns all posts' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:post) { FactoryBot.create(:post) }
      let!(:user) { FactoryBot.create(:user) }
 

      before do
        post "/users/{user.id}/posts", params:
                          { posts: {
                            title: my_post.title,
                            content: my_post.content
                          } }
      end

      it 'returns the title' do
        expect(json['title']).to eq(my_post.title)
      end

      it 'returns the content' do
        expect(json['content']).to eq(my_post.content)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post "/users/{user.id}/posts", params:
                          { posts: {
                            title: '',
                            content: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:post) { FactoryBot.create(:post) }
    let!(:user) { FactoryBot.create(:user) }

    before do
      delete "/users/{user.id}/posts/posts/#{post.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end