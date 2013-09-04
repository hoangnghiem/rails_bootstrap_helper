# coding: utf-8
module RailsBootstrapHelper
  
  module Helper
    def info_tag(text)
      content_tag(:i, '', class: 'glyphicon-info-sign', rel: 'tooltip', title: text) + " "
    end
    
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

    def badge_link_to(name, url, options={})
      badge = content_tag(:span, options.delete(:count).presence || "", class: "badge")
      link_to((name + " " + badge).html_safe, url, options)
    end

    def icon_link_to(text, url, options)
      icon = options.delete(:icon) if options.has_key?(:icon)
      icon_tag = ''
      if icon
        icon_klass = ["glyphicon-#{icon}"]
        if options.has_key?(:white)
          icon_klass << ["icon-white"]
          options.delete(:white)
        end
        icon_tag = content_tag(:i, '', class: icon_klass.join(' '))
      end
      link_to (icon_tag + " #{text}").html_safe, url, options
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
        klass = ["glyphicon-#{icon}"]
        if options.has_key?(:white)
          klass << ["icon-white"]
          options.delete(:white)
        end
        icon_tag = content_tag(:i, '', class: klass.join(' '))
      end
      
      button_link_to (icon_tag + " #{text}").html_safe, url, options
    end

  end

end
