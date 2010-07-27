Redmine::WikiFormatting::Macros.register do
  desc "Display graphs/reports. With no argument, provide a list of available graphs.\n" +
       "Available graphs :\n" +
       "  !{{graph(Issues)}} -- display number of issues in the last 6 months"

  macro :graph do |obj, args|
    args, options = extract_macro_options(args, :parent)
    return "Error: you should provide an ID with {{graph(X)}}" if args.size == 0
    graph = Graph.find_by_id(args.first.to_i)
    return "Error displaying graph, check if ID=#{args.first.to_i} is correct!" unless graph
    #TODO: solve this UGLY thing
    ActionView::Base.send(:include,GraphsHelper)
    render :partial => 'graphs/jqplot_graph', :locals => {:graph => graph}
  end
end
