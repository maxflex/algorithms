<?php
  class Queue
  {
    public $front = -1;
    public $rear  = -1;
    public $queue = [];

    public function __construct(int $size = 100)
    {
      $this->size  = $size;
    }

    public function isEmpty()
    {
      return ($this->front == -1 && $this->rear == -1);
    }

    public function isFull()
    {
      return $this->_nextCircular($this->rear) == $this->front;
    }

    public function enqueue($val)
    {
      if ($this->isFull()) {
        throw new Exception("Queue is full");
      }
      else if ($this->isEmpty()) {
        $this->front = $this->rear = 0;
      } else {
        $this->rear = $this->_nextCircular($this->rear);
      }
      $this->queue[$this->rear] = $val;
    }

    public function dequeue()
    {
      if ($this->isEmpty()) {
        return null;
      }
      $val = $this->front();
      if ($this->front == $this->rear) {
        $this->front = $this->rear = -1;
      } else {
        $this->front = $this->_nextCircular($this->front);
      }
      return $val;
    }

    public function front()
    {
      return $this->queue[$this->front];
    }

    public function print()
    {
      echo "FRONT: {$this->front}\n";
      echo "REAR: {$this->rear}\n";
      echo json_encode($this->queue);
      echo "\n";
    }

    private function _nextCircular($val)
    {
      return ($val + 1) % $this->size;
    }
}
