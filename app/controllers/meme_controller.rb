class MemeController < AppController

    set :views, './app/views'
    get '/hello' do
        "Our first Controller"
    end

    # before do
    #     begin
    #       @meme = meme_data
    #     rescue
    #       @meme = nil
    #     end
    #   end


   

    post '/memes/create' do
        begin
            meme = Meme.create( self.data(create: true) )
            json_response(code: 201, data: meme)
        rescue => e
            json_response(code: 422, data: { error: e.message })
        end
    end

    # data = JSON.parse(request.body.read)
  
    #     begin
            
    #         # today = Time.now
    #         name = data["name"]
    #         text_top = data["text_top"]
    #         text_bottom = data["text_bottom"]
    #         # image_url = data["image_url"]
    #         # todo = Todo.create(title: title, description: description, createdAt: today)
    #         # todo.to_json

            
    #         #option 2: Hash of columns
    #         # data["createdAt"] = today
    #         meme = Meme.create(data)
    #         [201, meme.to_json]

            


    #     rescue => e
    #         [422, {
    #             error: "an error occurred while creating a new meme"
    #         }.to_json]

    #     end
            
       
            
        
    #     #approach one: (individual columns)
    
    # end

    get '/memes' do
        meme = Meme.all
        [200, meme.to_json]
    end

    get '/view/memes' do 
        memes = Meme.all
        erb :memes
        
    end

    put '/memes/update/:id' do
        begin
            meme = Meme.find(self.meme_id)
            meme.update(self.data)
            json_response(data: { message: "meme updated successfully" })
        rescue => e
            json_response(code: 422 ,data: { error: e.message })
        end
    end
    #     begin
    #         data = JSON.parse(request.body.read)
    #         meme_id = params['id'].to_i
    #         meme = Meme.find(meme_id)
    #         meme.update(data)
    #         {message: "meme updated successfully"}.to_json
    #         rescue => e
    #             {error: e.message}.to_json
    #         end
    # end

    delete '/memes/destroy/:id' do
        begin
            meme = Meme.find(self.meme_id)
            meme.destroy
            json_response(data: { message: "meme deleted successfully" })
        rescue => e
          json_response(code: 422, data: { error: e.message })
        end
    end
    #     # begin
    #         meme_id = params['id'].to_i
    #         meme = Meme.find(meme_id)
    #         meme.destroy
    #         {message: "meme deleted successfully"}.to_json
    #     rescue => e
    #         [422, error: e.message].to_json
    #     end
    # end

private
def data(create: false)
   JSON.parse(request.body.read)
    end

    def meme_id
        params['id'].to_i
    end

end