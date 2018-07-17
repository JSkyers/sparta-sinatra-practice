class GamesController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $games = [{
	 id: 0,
	 title: "Game 1",
	 body: "Smite Battleground of the Gods"
},
{
    id: 1,
    title: "Game 2",
    body: "Final Fantasy XIV"
},
{
    id: 2,
    title: "Game 3",
    body: "Closers"
}]

  get "/" do
    @title = "Blog Games"
    @games = $games
    erb :"games/index"
  end

  get "/new" do
    erb :"games/form"
  end

  get "/:id" do
    id = params[:id].to_i
    @game = $games[id]
    erb :"games/show"
  end

  post "/" do
    id = params[:id]
    "This is the create route"
  end

  get "/:id/edit" do
    id = params[:id]
    "This is the edited route for #{id}"
  end

  put "/:id" do
    id = params[:id]
    "This is the updated route for #{id}"
  end

  delete '/:id' do
    id = params[:id]
    "This is the deleted route for #{id}"
  end
end
