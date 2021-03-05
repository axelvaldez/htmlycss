module Jekyll
  class RenderCodeBlock < Liquid::Block

    def render(context)
      preview = super
      code = preview.gsub("<spacer/>", "")
      code = code.gsub("<", "&lt;")
      code = code.gsub /^$\n/, ''
      preview_wrap_start = "<div class=\"codeblock\"><div class=\"codeblock-preview\">"
      preview_wrap_end = "</div>"
      code_wrap_start = "<div class=\"codeblock-code\"><pre><code class=\"language-html\">"
      code_wrap_end = "</code></pre><a href=\"#\" class=\"codeblock-copy btn btn-icon btn-noborder\"><i class=\"fas fa-copy\"></i><span>Copy</span></a></div></div>"
      
      
      
      preview_wrap_start + preview + preview_wrap_end + code_wrap_start + code + code_wrap_end
    end

  end
end

Liquid::Template.register_tag('codeblock', Jekyll::RenderCodeBlock)