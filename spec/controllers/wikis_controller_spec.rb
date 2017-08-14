require 'rails_helper'
include RandomData

RSpec.describe WikisController, type: :controller do
  let(:my_user) { create(:user) }
  let(:wiki) { create(:wiki, user: my_user) }


  describe "GET #index" do
    it "returns http success" do
      sign_in my_user
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [wiki] to @wikis" do
    sign_in my_user
           get :index
           expect(assigns(:wikis)).to eq([wiki])
         end

  end

  describe "GET new" do
     it "returns http success" do
      sign_in my_user
       get :new
       expect(response).to have_http_status(:success)
     end

     it "renders the #new view" do
       sign_in my_user
       get :new
       expect(response).to render_template :new
     end

     it "instantiates @wiki" do
       sign_in my_user
       get :new
       expect(assigns(:wiki)).not_to be_nil
     end
   end

   describe "POST create" do
     it "increases the number of Wiki by 1" do
       sign_in my_user
       expect{post :create, user_id: my_user.id, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false}}.to change(Wiki,:count).by(1)
     end

     it "assigns the new wiki to @wiki" do
       post :create, user_id: my_user.id, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false}
       expect(assigns(:wiki)).to eq Wiki.last
     end

     it "redirects to the new wiki" do
       sign_in my_user
       post :create, user_id: my_user.id, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false}
       expect(response).to redirect_to Wiki.last
     end
   end

   describe "GET show" do
       it "returns http success" do
          sign_in my_user
         get :show, {id: wiki.id}
         expect(response).to have_http_status(:success)
       end
       it "renders the #show view" do
          sign_in my_user
         get :show, {id: wiki.id}
         expect(response).to render_template :show
       end

       it "assigns wiki to @wiki" do
          sign_in my_user
         get :show, {id: wiki.id}
         expect(assigns(:wiki)).to eq(wiki)
       end
     end

     describe "GET edit" do
          it "returns http success" do
            sign_in my_user
            get :edit, {id: wiki.id}
            expect(response).to have_http_status(:success)
          end

          it "renders the #edit view" do
            sign_in my_user
            get :edit, {id: wiki.id}
            expect(response).to render_template :edit
          end

          it "assigns wiki to be updated to @wiki" do
            sign_in my_user
            get :edit, {id: wiki.id}

            wiki_instance = assigns(:wiki)

            expect(wiki_instance.id).to eq wiki.id
            expect(wiki_instance.title).to eq wiki.title
            expect(wiki_instance.body).to eq wiki.body
          end
        end

        describe "PUT update" do
             it "updates wiki with expected attributes" do
               sign_in my_user
               new_title = RandomData.random_sentence
               new_body = RandomData.random_paragraph

               put :update, id: wiki.id, wiki: {title: new_title, body: new_body}

               updated_wiki = assigns(:wiki)
               expect(updated_wiki.id).to eq wiki.id
               expect(updated_wiki.title).to eq new_title
               expect(updated_wiki.body).to eq new_body
             end

             it "redirects to the updated wiki" do
               sign_in my_user
               new_title = RandomData.random_sentence
               new_body = RandomData.random_paragraph

               put :update, id: wiki.id, wiki: {title: new_title, body: new_body}
               expect(response).to redirect_to wiki
             end
           end

           describe "DELETE destroy" do
                it "deletes the wiki" do
                  sign_in my_user
                  delete :destroy, {id: wiki.id}
                  count = Wiki.where({id: wiki.id}).size
                  expect(count).to eq 0
                end

                it "redirects to wikis index" do
                  sign_in my_user
                  delete :destroy, {id: wiki.id}
                  expect(response).to redirect_to wikis_path
                end
              end

context "premium able to update" do


describe "GET edit" do
     it "returns http success" do
       sign_in my_user
       my_user.role = :premium
       get :edit, {id: wiki.id}
       expect(response).to have_http_status(:success)
     end

     it "renders the #edit view" do
       sign_in my_user
       my_user.role = :premium
       get :edit, {id: wiki.id}
       expect(response).to render_template :edit
     end

     it "assigns wiki to be updated to @wiki" do
       sign_in my_user
       my_user.role = :premium
       get :edit, {id: wiki.id}

       wiki_instance = assigns(:wiki)

       expect(wiki_instance.id).to eq wiki.id
       expect(wiki_instance.title).to eq wiki.title
       expect(wiki_instance.body).to eq wiki.body
     end
   end

   describe "PUT update" do
        it "updates wiki with expected attributes" do
          sign_in my_user
          my_user.role = :premium
          new_title = RandomData.random_sentence
          new_body = RandomData.random_paragraph

          put :update, id: wiki.id, wiki: {title: new_title, body: new_body}

          updated_wiki = assigns(:wiki)
          expect(updated_wiki.id).to eq wiki.id
          expect(updated_wiki.title).to eq new_title
          expect(updated_wiki.body).to eq new_body
        end

        it "redirects to the updated wiki" do
          sign_in my_user
          my_user.role = :premium
          new_title = RandomData.random_sentence
          new_body = RandomData.random_paragraph

          put :update, id: wiki.id, wiki: {title: new_title, body: new_body}
          expect(response).to redirect_to wiki
        end
      end




end

context "admin able to update" do

  describe "GET edit" do
       it "returns http success" do
         sign_in my_user
         my_user.role = :admin
         get :edit, {id: wiki.id}
         expect(response).to have_http_status(:success)
       end

       it "renders the #edit view" do
         sign_in my_user
         my_user.role = :admin
         get :edit, {id: wiki.id}
         expect(response).to render_template :edit
       end

       it "assigns wiki to be updated to @wiki" do
         sign_in my_user
        my_user.role = :admin
         get :edit, {id: wiki.id}

         wiki_instance = assigns(:wiki)

         expect(wiki_instance.id).to eq wiki.id
         expect(wiki_instance.title).to eq wiki.title
         expect(wiki_instance.body).to eq wiki.body
       end
     end

     describe "PUT update" do
          it "updates wiki with expected attributes" do
            sign_in my_user
            my_user.role = :admin
            new_title = RandomData.random_sentence
            new_body = RandomData.random_paragraph

            put :update, id: wiki.id, wiki: {title: new_title, body: new_body}

            updated_wiki = assigns(:wiki)
            expect(updated_wiki.id).to eq wiki.id
            expect(updated_wiki.title).to eq new_title
            expect(updated_wiki.body).to eq new_body
          end

          it "redirects to the updated wiki" do
            sign_in my_user
            my_user.role = :admin
            new_title = RandomData.random_sentence
            new_body = RandomData.random_paragraph

            put :update, id: wiki.id, wiki: {title: new_title, body: new_body}
            expect(response).to redirect_to wiki
          end
        end



end



end
