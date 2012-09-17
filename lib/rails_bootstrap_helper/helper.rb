# coding: utf-8
module RailsBootstrapHelper
  
  module Helper
    def status_tag(status, options = {})
      klass = ["label"]
      if options.has_key?(:level)
        klass << "label-#{options.delete(:level).to_s}"
      end
      klass << options[:class].strip.split(/\s+/) unless options[:class].blank?
      options[:class] = klass.flatten.join(" ")
      content_tag(:span, status, options)
    end

    def badge_tag(status, options = {})
      klass = ["badge"]
      if options.has_key?(:level)
        klass << "badge-#{options.delete(:level).to_s}"
      end
      klass << options[:class].strip.split(/\s+/) unless options[:class].blank?
      options[:class] = klass.flatten.join(" ")
      content_tag(:span, status, options)
    end
    
    def button_link_to(text, url, options={})
      klass = ["btn"]
      if options.has_key?(:size)
        klass << "btn-#{options[:size]}"
        options.delete(:size)
      end
      if options.has_key?(:level)
        klass << "btn-#{options[:level]}"
        options.delete(:level)
      end
      klass << options[:class].strip.split(/\s+/) unless options[:class].blank?
      options[:class] = klass.flatten.join(" ")
      link_to text, url, options
    end
    
    def icon_button_link_to(text, url, options)
      icon = options.delete(:icon) if options.has_key?(:icon)
      icon_tag = ''
      if icon
        klass = ["icon-#{icon}"]
        if options.has_key?(:white)
          klass << ["icon-white"]
          options.delete(:white)
        end
        icon_tag = content_tag(:i, '', :class => klass.join(' '))
      end
      
      button_link_to (icon_tag + " #{text}").html_safe, url, options
    end

    def percent_input(f, field, lbl, input_field_options={})
      if input_field_options[:info].present?
        lbl = info_tag(input_field_options[:info]) + lbl
        input_field_options.delete(:info)
      end
      append = input_field_options.delete(:append)
      content = [content_tag(:span, '%', :class => "add-on"), " ", f.input_field(field, input_field_options)]
      content.reverse! if append
      f.input field, label: lbl, :wrapper => append ? :append : :prepend do
        content.join().html_safe
      end  
    end

    def money_input(f, field, lbl, input_field_options={})
      if input_field_options[:info].present?
        lbl = info_tag(input_field_options[:info]) + lbl
        input_field_options.delete(:info)
      end
      f.input field, label: lbl, :wrapper => :append do
        content_tag(:span, '$', :class => "add-on") + " " + 
        f.input_field(field, input_field_options)
      end  
    end

    def date_input(f, field, lbl, input_field_options={})
      if input_field_options[:info].present?
        lbl = info_tag(input_field_options[:info]) + lbl
        input_field_options.delete(:info)
      end
      f.input field, label: lbl, :wrapper => :append do
        (content_tag(:span, content_tag(:i, '', class: 'icon-calendar'), :class => "add-on")) + " " + 
        f.input_field(field, {as: :string, class: "datepicker"}.merge(input_field_options))
      end  
    end

    def url_input(f, field, lbl, input_field_options={})
      if input_field_options[:info].present?
        lbl = info_tag(input_field_options[:info]) + lbl
        input_field_options.delete(:info)
      end
      f.input field, label: lbl, :wrapper => :append do
        content_tag(:span, 'http://', :class => "add-on") + " " + 
        f.input_field(field, input_field_options)
      end  
    end

    def user_input(f, field, lbl, input_field_options={})
      if input_field_options[:info].present?
        lbl = info_tag(input_field_options[:info]) + lbl
        input_field_options.delete(:info)
      end
      f.input field, label: lbl, :wrapper => :append do
        (content_tag(:span, content_tag(:i, '', class: 'icon-user'), :class => "add-on")) + " " + 
        f.input_field(field, input_field_options)
      end  
    end
  end

end
