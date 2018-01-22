<?php
  class Stack
  {
    public $stack = [];

    public function __construct(int $size = 10)
    {
      $this->size = $size;
      $this->top = -1;
    }

    public function push($val)
    {
      if ($this->isFull()) {
        return false;
      }
      $this->top++;
      $this->stack[$this->top] = $val;
      return true;
    }

    public function pop()
    {
      if ($this->isEmpty()) {
        return null;
      }
      $val = $this->top();
      $this->top--;
      return $val;
    }

    public function top()
    {
      return $this->stack[$this->top];
    }

    public function isEmpty() : bool
    {
      return $this->top == -1;
    }

    public function isFull() : bool
    {
      return $this->top == ($this->size - 1);
    }
  }