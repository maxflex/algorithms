# Node class
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class LinkedList:
    # Function to initialize head
    def __init__(self):
        self.head = None

    # Function to insert a new node at the beginning
    def push(self, new_data):
        new_node = Node(new_data)
        new_node.next = self.head
        self.head = new_node

    # Utility function to prit the linked LinkedList
    def printList(self, node):
        temp = node
        while (temp):
            print(temp.data, end=" ")
            temp = temp.next

    def getHead(self):
        return self.head

    def createLoop(self, n):
        if n == 0:
            return None
        temp = self.head
        ptr = self.head
        cnt = 1
        while (cnt != n):
            ptr = ptr.next
            cnt += 1
        # print ptr.data
        while (temp.next):
            temp = temp.next
        temp.next = ptr

# Driver program
if __name__ == '__main__':
    t = int(input())
    for i in range(t):
        n = int(input())
        arr = list(map(int, input().strip().split()))
        lst = LinkedList()
        for i in arr:
            lst.push(i)
        ele = int(input())
        lst.createLoop(ele)
        if detectLoop(lst.getHead()):
            print(True)
        else:
            print(False)
# Contributed By: Harshit Sidhwa

def detectLoop(head):
  slow = head
  fast = head
  while True:
    if slow == None or fast == None:
      return False
      
    slow = slow.next

    for i in range(2):
      if fast.next != None:
        fast = fast.next
      else:
        return False

    if slow == fast:
      return True

