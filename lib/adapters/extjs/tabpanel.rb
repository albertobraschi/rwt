module Rwt
  class TabPanel
    def render_create
      @config.merge!(:items=>@components) if @components.length > 0

      Rwt << "var #{@config[:id]}=new Ext.TabPanel(#{@config.render});"
    end

  end
end