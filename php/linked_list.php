<?php
  class Node
  {
    public $next = null;

    public function __construct($val = null)
    {
      $this->val = $val;
    }
  }

  class LinkedList
  {
    public function __construct($val)
    {
      $this->head = new Node($val);
    }

    public function insert($val)
    {
      $current = $this->head;
      while ($current->next !== null) {
        $current = $current->next;
      }
      $current->next = new Node($val);
    }

    public function reverse(&$node, $prev)
    {
        $tmp = $node;
        $next = $node->next;
        $node->next = $prev;
        if ($next === null) {
          $this->head = $node;
        } else {
          $this->reverse($next, $tmp);
        }
    }

    public function removeDuplicatesSorted()
    {
      $current = $this->head;
      while ($current !== null) {
        $c = $current->next;
        while ($c !== null && $c->val == $current->val) {
          $c = $c->next;
        }
        if ($c !== $current->next) {
          $current->next = $c;
        }
        $current = $current->next;
      }
    }

    public function removeDuplicatedUnsorted()
    {
      # code...
    }

    public function print()
    {
      $current = $this->head;
      while ($current !== null) {
        echo $current->val;
        $current = $current->next;
      }
      echo "\n";
    }
  }

  printf('d', 1);
  // $l = new LinkedList(1);
  // $l->insert(1);
  // $l->insert(2);
  // $l->insert(2);
  // $l->insert(2);
  // $l->insert(2);
  // $l->insert(2);
  // $l->insert(3);
  // $l->insert(3);
  //
  // $l->removeDuplicatesSorted();
  //
  // $l->print();