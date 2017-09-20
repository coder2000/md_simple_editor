module MdSimpleEditor
  module Rails
    module MdHelper
      FontAwesome::Sass::Rails::ViewHelpers

      def md_simple_editor(klass='')
        @md_builder = MdBuilder.new(klass)
        content_tag(:div, :id => 'md-editor') do
          #content_tag(:div, :class => 'btn-toolbar mb-2', role: 'toolbar') do
          #  header_tags + text_tools + link_and_image_tools +
          #    content_tag(:div, class: 'btn-group float-right') do
          #      button_tag(:type => 'button', :class => "#{@md_builder.default_class} btn-info preview_md") do
          #        'Preview'
          #      end
          #    end
          #end +
          render 'md_simple_editor/toolbar'
          content_tag(:div, :id => 'md-text') do
            yield
          end +
          content_tag(:div, class: 'card border-success preview-panel', hidden: true) do
            content_tag(:div, :id => 'md-preview', class: 'card-body') do
            end
          end
        end
      end

      def header_tags
        content_tag(:div, :class => 'btn-group mr-2', role: :group) do
          button_tag(type:         'button', class: "#{@md_builder.default_class} dropdown-toggle",
                     'data-toggle' => :dropdown, 'aria-haspopup' => 'true', 'aria-expanded' => 'false') do
            'Headers'
          end +
            content_tag(:div, :class => 'dropdown-menu') do
              button_tag(type: 'button', class: "#{@md_builder.default_class} md_h1 dropdown-item") do
                content_tag(:strong, 'H1')
              end +
              button_tag(type: 'button', class: "#{@md_builder.default_class} md_h2 dropdown-item") do
                content_tag(:strong, 'H2')
              end +
              button_tag(type: 'button', class: "#{@md_builder.default_class} md_h3 dropdown-item") do
                content_tag(:strong, 'H3')
              end +
              button_tag(type: 'button', class: "#{@md_builder.default_class} md_h4 dropdown-item") do
                content_tag(:strong, 'H4')
              end +
              button_tag(type: 'button', class: "#{@md_builder.default_class} md_h5 dropdown-item") do
                content_tag(:strong, 'H5')
              end
            end
        end
      end

      def link_and_image_tools
        content_tag(:div, :class => 'btn-group mr-2') do
          button_tag(:type => 'button', :class => "#{@md_builder.default_class} md_link") do
            icon 'link'
          end +
            button_tag(:type => 'button', :class => "#{@md_builder.default_class} md_camera-retro") do
              icon 'camera-retro'
            end
        end
      end

      def text_tools
        content_tag(:div, :class => 'btn-group mr-2') do
          button_tag(type: 'button', class: "#{@md_builder.default_class} md_italic") do
            icon 'italic'
          end +
            button_tag(type: 'button', class: "#{@md_builder.default_class} md_bold") do
              icon 'bold'
            end +
            button_tag(:type => 'button', class: "#{@md_builder.default_class} md_list-ul") do
              icon 'list-ul'
            end +
            button_tag(:type => 'button', class: "#{@md_builder.default_class} md_list-ol") do
              icon 'list-ol'
            end +
            button_tag(:type => 'button', class: "#{@md_builder.default_class} md_indent") do
              icon 'indent'
            end +
            button_tag(:type => 'button', class: "#{@md_builder.default_class} md_underline") do
              icon 'underline'
            end +
            button_tag(:type => 'button', class: "#{@md_builder.default_class} md_table") do
              icon 'table'
            end +
            button_tag(:type => 'button', class: "#{@md_builder.default_class} md_square") do
              icon 'square'
            end +
            button_tag(:type => 'button', class: "#{@md_builder.default_class} md_minus") do
              icon 'minus'
            end
        end
      end
    end
  end
end
