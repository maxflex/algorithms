<?php
  declare(strict_types = 1);

  require('helpers.php');
  require('queue.php');

  class Node
  {
    public $left = null;
    public $right = null;

    public function __construct(?int $val = null)
    {
      $this->val = $val;
    }

    public function __toString()
    {
      return (string)$this->val . "\n";
    }
  }

  class BST
  {
    const TRAVERSE_INORDER   = 0;
    const TRAVERSE_PREORDER  = 1;
    const TRAVERSE_POSTORDER = 2;

    public function __construct()
    {
      $this->root = null;
    }

    public function insert(int $val)
    {
      $this->_insert($this->root, $val);
    }

    public function delete(int $val)
    {
      $this->root = $this->_delete($this->root, $val);
    }

    public function find(int $val) : ?Node
    {
      return $this->_find($this->root, $val);
    }

    public function traverse(int $type = self::TRAVERSE_INORDER)
    {
      $this->_traverse($this->root, $type);
    }

    public function min(Node $node) : ?Node
    {
      $current = $node;
      while ($current->left !== null) {
        $current = $current->left;
      }
      return $current;
    }

    public function max(Node $node) : ?Node
    {
      if ($node->right !== null) {
        return $this->max($node->right);
      }
      return $node;
    }

    private function _insert(?Node &$node, $val)
    {
      if ($node === null) {
        $node = new Node($val);
      }
      else if ($val > $node->val) {
        $this->_insert($node->right, $val);
      } else {
        $this->_insert($node->left, $val);
      }
    }

    public function regularInsert($val)
    {
      $a = [];
      array_push($a, $this->root);
      $root = array_shift($a);
      $root = new Node($val);
    }

    public function height(?Node $node)
    {
      if ($node === null) {
        return -1;
      }
      $left_height  = $this->height($node->left);
      $right_height = $this->height($node->right);
      return max($left_height, $right_height) + 1;
    }

    public function depth(?Node $node)
    {
      $depth = 0;
      $current = $this->root;
      while ($current !== $node && $depth < 10) {
        $depth++;
        if ($node->val > $current->val) {
          $current = $current->right;
        } else {
          $current = $current->left;
        }
      }
      return $depth;
    }


    private function isSubtreeGreater(?Node $node, $val)
    {
      if ($node === null) return true;
      return ($node->val > $val && $this->isSubtreeGreater($node->left, $val) && $this->isSubtreeGreater($node->right, $val));
    }

    private function isSubtreeLess(?Node $node, $val)
    {
      if ($node === null) return true;
      return ($node->val < $val && $this->isSubtreeLess($node->left, $val) && $this->isSubtreeLess($node->right, $val));
    }

    public function isBst(?Node $node)
    {
      if ($node === null) return true;
      return ($this->isSubtreeGreater($node->right, $node->val) &&
          $this->isSubtreeLess($node->left, $node->val) &&
          $this->isBst($node->left) &&
          $this->isBst($node->right)
      );
    }

    public function isBstInorder(?Node $node, &$val)
    {
      if ($node === null) return true;
      $a = $this->isBstInorder($node->left, $val);
      $b = $node->val > $val;
      $val = $node->val;
      $c = $this->isBstInorder($node->right, $val);
      return ($a && $b && $c);
    }

    public function successor(int $val)
    {
      $node = $this->find($val);

      // case 1: has right subtree
      if ($node->right !== null) {
        return $this->min($node->right);
      }
      // case 2
      $current = $this->root;
      $successor = null;

      while ($current->val !== $val) {
        if ($val < $current->val) {
          $successor = $current;
          $current = $current->left;
        }
        else if ($val > $current->val) {
          $current = $current->right;
        }
      }

      return $successor;
    }

    /**
     * @depricated
     */
    public function __isBST()
    {
      $q = new Queue();

      $q->enqueue($this->root);

      while (! $q->isEmpty()) {
        $node = $q->dequeue();
        if ($node->left !== null) {
          if ($node->left->val > $node->val) return false;
          $q->enqueue($node->left);
        }
        if ($node->right !== null) {
          if ($node->right->val < $node->val) return false;
          $q->enqueue($node->right);
        }
      }

      return true;
    }

    public function levelTraverse()
    {
      $q = new Queue();
      $q->enqueue($this->root);
      $depth = 0;
      while(! $q->isEmpty()) {
        $node = $q->dequeue();
        if ($node !== null) {
          if ($node->left !== null) {
            $q->enqueue($node->left);
          }
          if ($node->right !== null) {
            $q->enqueue($node->right);
          }
          $new_depth = $this->depth($node);
          if ($new_depth > $depth) {
            echo "\n";
          }
          $depth = $new_depth;
          echo $node->val . ' ';
        }
      }
    }

    private function _traverse(?Node &$node, $type)
    {
      if ($node !== null) {
        if ($type == self::TRAVERSE_PREORDER)  echo($node->val) . ' ';
        $this->_traverse($node->left, $type);
        if ($type == self::TRAVERSE_INORDER)   echo($node->val) . ' ';
        $this->_traverse($node->right, $type);
        if ($type == self::TRAVERSE_POSTORDER) echo($node->val) . ' ';
      }
    }

    private function _find(?Node $node, $val) : ?Node
    {
      if ($node === null) return null;
      if ($val > $node->val) {
        return $this->_find($node->right, $val);
      }
      else if ($val < $node->val) {
        return $this->_find($node->left, $val);
      } else {
        return $node;
      }
    }


    private function _delete(?Node &$node, $val) : ?Node
    {
      if ($node === null) {
        return null;
      }
      if ($val > $node->val) {
        $node->right = $this->_delete($node->right, $val);
      }
      else if ($val < $node->val) {
        $node->left = $this->_delete($node->left, $val);
      } else {
        /**
         * NODE FOUND
         */
        # case 1: no children
        if ($node->left === null && $node->right === null) {
            return null;
        }
        # case 2: only 1 child
        else if ($node->left === null && $node->right !== null) {
          return $node->right;
        }
        else if ($node->left !== null && $node->right === null) {
          return $node->left;
        }
        # case 3: 2 children
        else {
          $max = $this->max($node->left);
          $node->val = $max->val;
          $node->left = $this->_delete($node->left, $max->val);
        }
      }
      return $node;
    }
  }

  $bst = new BST();

  // $bst->root = new Node(5);
  // $bst->root->left = new Node(3);
  // $bst->root->right = new Node(10);
  // $bst->root->left->left = new Node(2);
  // $bst->root->left->right = new Node(6);

  // foreach(range(1, 10) as $i) {
  //   $bst->insert($i);
  // }

  foreach([1, 5, 3, 8, 2, 4, 7, 9] as $i) {
  // foreach([1, 5, 3, 8] as $i) {
    $bst->insert($i);
  }

  echo $bst->successor(4);

  // echo "HEIGHT: " . $bst->height($bst->root) . "\n";

  // echo "DEPTH: " . $bst->depth($bst->root->right);
  // echo $bst->isBst($bst->root) ? "true" : "false"; echo "\n";
  //
  // $min = PHP_INT_MIN;
  // echo $bst->isBstInorder($bst->root, $min) ? "true" : "false"; echo "\n";

  // $bst->levelTraverse();
  // $bst->traverse();

  // var_dump($bst);
  echo "\n";