require "./lib/linked_list.rb"

list1=LinkedList.new()
list1.append(12)
list1.prepend(8)
list1.append(10)
list1.insert_at(3,1)
list1.insert_at(18,2)
list1.remove_at(3)

p list1.list
p list1.to_s