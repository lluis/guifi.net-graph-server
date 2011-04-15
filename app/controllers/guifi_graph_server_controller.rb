class GuifiGraphServerController < InitrController
  unloadable

  menu_item :initr

  before_filter :find_guifi_graph_server
  before_filter :authorize

  def configure
    if request.post?
      params["guifi_graph_server"] ||= {}
      if @klass.update_attributes(params["guifi_graph_server"])
        flash[:notice]='Configuration saved'
        redirect_to :controller => 'klass', :action => 'list', :id => @node
      else
        render :action=>'configure'
      end
    end
  end

  private

  def find_guifi_graph_server
    @klass = Initr::GuifiGraphServer.find params[:id]
    @node = @klass.node
    @project = @node.project
  end

end
