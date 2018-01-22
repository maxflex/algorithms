<?php
  //
  // function fact($n)
  // {
  //   print_stack();
  //   if ($n == 1) {
  //     return 1;
  //   }
  //   return $n * fact($n - 1);
  // }


  function print_stack()
  {
    $e = new \Exception;
    echo "===========\n";
    var_dump($e->getTraceAsString());
    echo "===========\n\n";
  }

  function fact($n)
  {
    print_stack();
    return _fact($n, 1);
  }

  function _fact($n, $result)
  {
    print_stack();
    if ($n == 0) {
      return $result;
    }
    return _fact($n - 1, $n * $result);
  }

  echo fact(3);
  print_stack();
  echo "\n";