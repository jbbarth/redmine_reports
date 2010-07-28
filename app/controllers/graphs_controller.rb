class GraphsController < ApplicationController
  unloadable

  layout 'admin'

  def index
    @graphs = Graph.all
  end
  
  def show
    @graph = Graph.find(params[:id])
  end
  
  def new
    @graph = Graph.new
    if params[:copy_from]
      @graph.attributes = Graph.find_by_id(params[:copy_from]).try(:attributes)
      @graph.title = l(:label_graph_new)
    end
  end
  
  def create
    @graph = Graph.new(params[:graph])
    if @graph.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to graph_path(@graph)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @graph = Graph.find(params[:id])
  end
  
  def update
    @graph = Graph.find(params[:id])
    if @graph.update_attributes(params[:graph])
      flash[:notice] = l(:notice_successful_update)
      redirect_to graph_path(@graph)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @graph = Graph.find(params[:id])
    @graph.destroy
    flash[:notice] = l(:notice_successful_delete)
    redirect_to graphs_path
  end
end
