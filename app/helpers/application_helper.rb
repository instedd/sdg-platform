module ApplicationHelper

  def active_label(form, field, instance, opts = {})
    options = opts.merge({class: instance.send(field) ? "active #{opts[:class]}" : ""})
    form.label field, options
  end

  def active_label_tag(field, label, instance)
    label_tag field, label, class: instance.send(field).blank? ? "" : "active"
  end

  def checkmark_icon(yes)
    if yes
      haml_tag :i, "check", class: 'material-icons'
    end
  end

  def ods(number, opts, &block)
    haml_tag :div, class: 'row' do
      haml_tag :div, class: "sdg-header ods#{number}" do
        haml_tag :div, class: 'svg-container col m2 s12 hide-on-small-only' do
          haml_tag :svg, class: "logo ods#{number}" do
            haml_tag :use, "xlink:href" => "#ODS#{number}", class: "inverted"
          end
        end
        haml_tag :div, class: 'sdg-content col m10 s12' do
          haml_tag :div, SustainableDevelopmentGoal.find(number).title, class: 'title'
          haml_tag :div, opts[:lead], class: 'lead'
        end
      end
    end
    haml_tag :div, class: 'targets row' do
      haml_tag :div, class: 'col m2'
      haml_tag :div, class: 'col m10 s12 content' do
        haml_tag :h2, "Metas para el objetivo #{number}", class: 'targets-header'
        block.call
      end
    end
  end

  def pp_sdg(goal)
    haml_tag :div, class: "sdg-name" do
      haml_tag :span, goal.number, class: "sdg_badge ods#{goal.number}"
      haml_tag :span, goal.name, class: "font-sdg#{goal.number}"
    end
  end

  def inline_sdg(goal)
    haml_tag :span, goal.name, class: "font-sdg#{goal.number}"
    haml_tag :span, goal.number, class: "sdg_badge ods#{goal.number}"
  end

  def names_for(list)
    list.map{|o| o.name}.join(", ")
  end
end
