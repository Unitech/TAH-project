if defined?(Footnotes) && Rails.env.development?
  Footnotes.run! # first of all

  Footnotes::Filter.notes = [:integration, :javascripts, :current_user, :queries, :log]
  # ... other init code
end

#
# Show view
#
module Footnotes
  module Notes
    class IntegrationNote < AbstractNote
      def initialize(controller)
        @params = controller.params.symbolize_keys
        @controller_name = @params[:controller]
        @action_name = @params[:action]
        @text = "#{Rails.root}/app/views/#{@controller_name}/#{@action_name}.html.erb"
      end

      # Returns the title that represents this note.
      #
      def title
        "View : #{@text}"
      end
      
      def content
        html = ''
        html << <<-HTML
            <b>View</b><br />

<a href="#{Footnotes::Filter.prefix(@text, 1, 1)}">#{@text}</a>
          HTML
        return html
      end
    end
  end
end

module Footnotes
  module Notes
    class CurrentUserNote < AbstractNote
      # This method always receives a controller
      #
      def initialize(controller)
        @current_user = controller.instance_variable_get("@current_user")
      end

      # Returns the title that represents this note.
      #
      def title
        "Current user: #{@current_user}"
      end

      # This Note is only valid if we actually found an user
      # If it's not valid, it won't be displayed
      #
      def valid?
        @current_user
      end

      # The fieldset content
      #
      def content
        escape(@current_user.inspect)
      end
    end
  end
end
