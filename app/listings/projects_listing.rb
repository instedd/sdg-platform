class ProjectsListing < Listings::Base
  include ApplicationHelper
  model do
    projects = if current_user.is_admin
      Project
    else
      Project.where(organization_id: current_user.organization.id)
    end

    projects.order('published DESC').includes(:populations).includes(:locations)
  end

  scope 'Todos', :all, default: true
  scope 'Pendientes', :pending

  column :name, searchable: true
  column :locations, sortable: false do |project, value|
    names_for(value)
  end
  column :populations, sortable: false do |project, value|
    names_for(value)
  end
  column :start_date do |project, value|
   value.try(:strftime,"%d/%m/%Y")
  end
  column :end_date do |project, value|
   value.try(:strftime,"%d/%m/%Y")
  end

  column :published do |project, value|
    raw('<i class="material-icons">check</i>') if value
  end

  column '' do |project|
    link_to 'Editar', edit_project_path(project)
  end

  column '' do |project|
    link_to 'Borrar', project, :method => :delete, :data => { :confirm => '¿Borrar este proyecto?' }
  end
end
