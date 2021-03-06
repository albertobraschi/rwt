module Rwt
  class Toolbar
    def render_create
      @config.merge!(:items=>@components) if @components.length > 0
      if @owner.class == Rwt::App || @owner.class == NilClass
        Rwt << "var tb=new Ext.Toolbar(#{@config.render});"
        if @place
          Rwt << "if(!Ext.get('#{@place}')){"+
            'var div=document.createElement("div");'+
            "div.setAttribute('id','#{@place}');"+
            'document.getElementsByTagName("body")[0].appendChild(div)'+
          '}'+
          "tb.render('#{@place}');"
        else
          Rwt << "if (owner==Rwt){tb.render(document.body)}"
        end
        Rwt << "if(!owner.tb){owner.tb=tb}"
      else
        Rwt << {:xtype=>'toolbar',:items=>@components}.render
      end
    end
  end

  class Text < Rwt::Component
    def render_create
      if @owner.class == Toolbar     # inside a toolbar whe should use tbtext
        @config.merge!(:xtype=>'tbtext')
      end
      Rwt << "var #{self}=#{@config.render};"
    end
  end

  class Menu < Rwt::Component
    def render_create
      Rwt << "var #{self}=#{@config.merge(:menu=>@components).render};"
    end
  end

  class MenuItem < Rwt::Component
    def render_create
      @config.merge!(:items=>@components) if @components.length > 0
      Rwt << "var #{self}=#{@config.render};"

      #TODO: render as new Ext.menu.Item and generate events (to use the same pattern of other components)
#      generate_default_events



    end
  end

end
