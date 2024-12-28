class HtmlTag
    attr_reader :name, :attributes, :children
    attr_accessor :content
  
    def initialize(name, attributes = {}, content = nil)
      @name = name
      @attributes = attributes
      @content = content
      @children = []
    end
  
    # Добавление дочернего элемента
    def add_child(tag)
      @children.push(tag)
    end
  
    # Проверка наличия детей
    def has_children?
      !@children.empty?
    end
  
    # Количество детей
    def count_children
      @children.size
    end
  
    # Преобразование в строку
    def tag_info
      attrs = @attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")
      "Tag: #{@name}, Attributes: #{attrs.empty? ? 'none' : attrs}"
    end
 
    def to_s
        attrs = @attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")
        opening_tag = "<#{@name}#{' ' unless attrs.empty?}#{attrs}>"
        closing_tag = "</#{@name}>"
        children_html = @children.map(&:to_s).join
        "#{opening_tag}#{@content}#{children_html}#{closing_tag}"
    end

  end
  