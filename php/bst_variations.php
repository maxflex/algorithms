<?php
  /*
      Given N distinct values
      How many BSTs can be built out of them?
   */

  $n = readline("N=");

  $a = [1, 1];

  foreach(range(2, $n) as $current) {
    // echo "$current: \n";
    $a[$current] = 0;
    foreach(range(0, $current - 1) as $i) {
      $a[$current] += ($a[$i] * $a[$current - $i - 1]);
      // echo $i . " | " . ($current - $i - 1) . "\n";
    }
    // echo "==========\n";
  }

  echo "ANSWER=" . $a[$n] . "\n";
