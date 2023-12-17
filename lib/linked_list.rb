require "./lib/node.rb"

class LinkedList
    attr_accessor :list
    def initialize()
        self.list=[]
    end

    def append(value)
        new_node=Node.new()
        new_node.value=value
        if self.list==[]
            self.list.push(new_node)
        else
            self.list[-1].next_node=value
            self.list.push(new_node)
        end
    end
    def prepend(value)
        new_node=Node.new()
        new_node.value=value
        if self.list==[]
            self.list.unshift(new_node)
        else
            new_node.next_node=self.list[0].value
            self.list.unshift(new_node)
        end
    end
    def size()
        self.list.length
    end
    def head()
        self.list[0]
    end
    def tail()
        self.list[-1]
    end
    def at(index)
        self.list[index]
    end
    def pop()
        if self.list.length>1
            self.list[-2].next_node=nil
        end
        self.list.pop
    end
    def contains?(value)
        self.list.each do |node|
            if node.value==value
                return true
            end
        end
        false
    end
    def find(value)
        self.list.each_with_index do |node,index|
            if node.value==value
                return index
            end
        end
        nil
    end
    def to_s()
        self.list.reduce("") do |str,node| 
            def get_string(node)
                case node.next_node
                when nil
                    "(#{node.value}) -> nil"
                else
                    "(#{node.value}) -> "
                end
            end
            str+get_string(node)
        end
    end
    def insert_at(value,index)
        if index>self.list.length || index<0
            raise ArgumentError.new(
                "Enter an index between \"0 and #{self.list.length}\""
            )
        end
        new_node=Node.new()
        new_node.value=value
        self.list.insert(index, new_node)
        if index>0
            self.list[index-1].next_node=value
        end
        if index+1 < self.list.length
            new_node.next_node=self.list[index+1].value
        end
    end
    def remove_at(index)
        if index+1>self.list.length || index<0
            raise ArgumentError.new(
                "Enter an index between \"0 and #{self.list.length-1}\""
            )
        end
        self.list.delete_at(index)
        if index==0
            return
        elsif index==self.list.length
            self.list[-1].next_node=nil
        else
            self.list[index-1].next_node=self.list[index].value
        end
    end
end

