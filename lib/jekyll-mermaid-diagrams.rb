
module Jekyll
  module Mermaid
    module Diagrams
      class Error < StandardError; end
      # Your code goes here...
      class MermaidChart < Liquid::Block

        def initialize(tag_name, markup, tokens)
          super
        end

        def render(context)
          @config = context.registers[:site].config['mermaid']
          "<script src=\"#{@config['src']}\"></script>"\
          "<script>
              var config = {
              startOnReady:true,
              theme: 'forest',
              useMaxWidth:false,
              htmlLabels:true
              }
            };
          mermaid.initialize(config);
          window.mermaid.init(undefined, document.querySelectorAll('.language-mermaid'));</script>"\
          "<div class=\"mermaid\">#{super}</div>"
        end
      end
    end
  end
end
Liquid::Template.register_tag('mermaid', Jekyll::Mermaid::Diagrams::MermaidChart)

