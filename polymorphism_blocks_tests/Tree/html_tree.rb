require_relative 'html_tag'

class HtmlTree
  include Enumerable

  attr_reader :root

  def initialize(html_string)
    @root = parse_html(html_string)
  end

  def each(&block)
    dfs(@root, &block)
  end

  def bfs(&block)
    bfs_traversal(@root, &block)
  end

  private

  # Обход в глубину
  def dfs(node, &block)
    return if node.nil?

    block.call(node)
    node.children.each { |child| dfs(child, &block) }
  end

  # Обход в ширину
  def bfs_traversal(node, &block)
    return if node.nil?

    queue = [node]
    until queue.empty?
      current = queue.shift
      block.call(current)
      queue.concat(current.children)
    end
  end

  # Парсинг HTML в дерево
  def parse_html(html_string)
    tokens = tokenize(html_string)
    build_tree(tokens)
  end

  # Разбиение строки HTML на токены
  def tokenize(html_string)
    html_string.scan(/<[^>]+>|[^<]+/)
  end

  # Построение дерева из токенов
  def build_tree(tokens)
    root = nil
    stack = []

    tokens.each do |token|
      if token.start_with?('</') # Закрывающий тег
        stack.pop
      elsif token.start_with?('<') # Открывающий тег
        tag_name, attributes = parse_tag(token)
        tag = HtmlTag.new(tag_name, attributes)
        if stack.empty?
          root = tag
        else
          stack.last.add_child(tag)
        end
        stack.push(tag)
      else # Текстовое содержимое
        stack.last.content = token if stack.any?
      end
    end

    root
  end

  # Парсинг одного тега
  def parse_tag(tag)
    tag_name = tag.match(/<(\w+)/)[1]
    attributes = {}
    tag.scan(/(\w+)="([^"]*)"/).each { |key, value| attributes[key] = value }
    [tag_name, attributes]
  end
end
