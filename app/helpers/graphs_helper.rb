module GraphHelper
  def jqplot_graph(graph)
    return unless graph.is_a?(Graph)
    html = []
    html << "line#{graph.id} = #{graph.eval_source};"
    html << "plot#{graph.id} = $.jqplot('chart#{graph.id}', [line#{graph.id}], {"
    html << "  title: '#{graph.title}',"
    html << "  #{graph.rendering}"
    html << "});"
  end
end
