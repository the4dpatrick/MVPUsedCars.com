module CarsHelper
  def scale_car_title(make, model)
    class_name = make.length + model.length >= 15 ? 'smaller' : nil

    content_tag(:h1, class: class_name) do
      concat(make + ' ')
      concat(content_tag(:span) { model })
    end
  end
end
