require_relative 'html_tree'

html = "
<html>
  <body>
    <div class=\"container\">
      <p>Paragraph 1</p>
    </div>
    <div>
      <p>Paragraph 2</p>
    </div>
  </body>
</html>"

tree = HtmlTree.new(html)

puts "\nВывод экземпляра дерева в формате строки: #{tree.root}"

puts "\nМетод count с условием (имя div): #{tree.count { |x| x.name == 'div' }}"

puts "\nМетод has_children для всех элементов дерева: "
tree.each { |node| puts "#{node.name}: #{node.has_children?}" }

puts "\nДети корневого узла:"
tree.root.children.each { |child| puts child.tag_info }

puts "\nВывод всех элементов дерева с помощью обхода в глубину: "
tree.each { |node| puts node.tag_info }

puts "\nОбход в ширину (BFS):"
tree.bfs { |node| puts node.tag_info }

puts "\nSelect:"
selected_nodes = tree.select { |node| node.name == 'body' }
selected_nodes.each { |node| puts "Tag: #{node.name}" }