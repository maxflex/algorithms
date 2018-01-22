<?php
  function print_stack()
  {
    $e = new \Exception;
    echo "===========\n";
    var_dump($e->getTraceAsString());
    echo "===========\n\n";
  }