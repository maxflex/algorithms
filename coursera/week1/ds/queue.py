class Queue:
    def __init__(self, size):
        self.items = [None] * size
        self.size = size
        self.current = 0
        self.next = 0

    def enqueue(self, item):
        assert not self.is_full()
        self.items[self.next] = item
        self.next = self.__next_index(self.next)

    def dequeue(self):
        assert not self.is_empty()
        self.items[self.current] = None
        self.current = self.__next_index(self.current)

    def peek(self):
        return self.items[self.current]

    def is_empty(self) -> bool:
        return self.current == self.next

    def is_full(self) -> bool:
        return self.__next_index(self.next) == self.next

    def __next_index(self, index):
        next_index = index + 1
        return next_index if next_index < self.size else 0
