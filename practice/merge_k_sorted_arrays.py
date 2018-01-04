class QueueNode:
  def __init__(self, a, i = 0):
    self.a = a
    self.i = i

class Queue:
  def __init__(self, nodes):
    self.nodes = nodes
    self.build_min_heap()

  def min_heapify(i):
    

  def __build_min_heap(self):
    for i in reversed(range(len(self.nodes))):
      self.min_heapify(i)

# Your code goes here
if __name__=='__main__':
    t = int(input())
    for i in range(t):
        n = int(input())
        arr = list(map(int, input().strip().split()))
        matrix = [[0 for i in range(n)]for j in range(n)]
        c=0
        for i in range(n):
            for j in range(n):
                matrix[i][j] = arr[c]
                c+=1
        a = mergeKArrays(matrix, n)
        for e in a:
            print(e, end=" ")
        print('')
# Contributed by: Harshit Sidhwa
