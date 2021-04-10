module Jekyll
  class RenderCodeBlock < Liquid::Block

    def render(context)
      content = super.split('---')
      html = content.first
      css = content.last
      suffix = rand(0..2147483647).to_s
      cssmod = css.gsub('&', '.class' + suffix);
      css = css.gsub('>>', '<strong>');
      css = css.gsub('<<', '</strong>');
      html = html.gsub /^$\n/, ''
      css = css.gsub('& ', '');
      css = css.gsub /^$\n/, ''
      
      outputpreview = ''
      if html != ''
        outputpreview = "<div class=\"codeblock-preview class#{suffix}\">"
        outputpreview += html
        outputpreview += "<style>"
        outputpreview += cssmod
        outputpreview += "</style>"
        outputpreview += "</div>"
      end

      outputhtml = ''
      if html != ''
        html = html.gsub("<", "&lt;")
        html = html.gsub("/assets/img/posts/", "")
        outputhtml = "<div class=\"codeblock-code html\">"
        outputhtml += "<pre><code class=\"language-HTML\">"
        outputhtml += html
        outputhtml += "</code></pre>"
        outputhtml += "</div>"
      end
      
      outputcss = ''
      if css != ''
        outputcss = "<div class=\"codeblock-code css\">"
        outputcss += "<pre><code class=\"language-CSS\">"
        outputcss += css
        outputcss += "</code></pre>"
        outputcss += "</div>"
      end
      
      
      #output
      outputpreview + outputhtml + outputcss
    end

  end
end

Liquid::Template.register_tag('codeblock', Jekyll::RenderCodeBlock)