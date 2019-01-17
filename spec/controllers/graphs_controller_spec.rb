require "spec_helper"

describe GraphsController, type: :controller do

  render_views

  include ActiveSupport::Testing::Assertions
  fixtures :users

  before do
    @controller = GraphsController.new
    @request = ActionDispatch::TestRequest.create
    @response = ActionDispatch::TestResponse.new
    User.current = nil
    @request.session[:user_id] = 1 # admin
  end

  it "should #create" do
    assert_difference 'Graph.count' do
      post :create, params: {:graph => {:title => "Test Title", :language => "ruby", :source => "None", :rendering => "Nope"}}
    end
    graph = Graph.order('id DESC').first
    expect(response).to redirect_to(graph_path(graph))
    expect(graph.title).to eq "Test Title"
    expect(graph.author_id).to eq 1
  end

end
