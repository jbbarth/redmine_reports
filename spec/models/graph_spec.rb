require "spec_helper"

describe "Graph" do
  fixtures :graphs, :users

  it "should eval source" do
    data = "[['frogs',3],['buzzards',7],['deer',2.5],['turkeys',6],['moles',5],['ground hogs',4]]"
    expect(Graph.find(1).eval_source).to eq data
    expect(Graph.find(2).eval_source).to eq "chart2line1 = #{data.gsub("'",'"')}"
  end

  it "should renderers" do
    expect(Graph.find(1).renderers).to eq ["plugins/jqplot.pieRenderer.js"]
  end

  it "should set anonymous when deleting a author user" do
    graph_test = Graph.find(1)
    user_test = User.create(:login => "test", :firstname => 'test', :lastname => 'test',
            :mail => 'test.test@test.fr', :language => 'fr')
    graph_test.author_id = user_test.id
    graph_test.save

    user_test.destroy
    graph_test.reload
    expect(graph_test.author_id).to eq(User.anonymous.id)
  end
end
