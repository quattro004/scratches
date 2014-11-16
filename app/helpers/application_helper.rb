module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => 'button-xs')
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", :class => 'button-xs-danger')
  end

  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '' )
  end

  def populate_album_item(item, field)
    item.name         = base_part_of(field.original_filename)
    item.content_type = field.content_type.chomp
    item.data         = field.read
    item.size         = field.size
  end
end
