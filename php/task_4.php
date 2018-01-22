<?php
  /**
   * Алгоритм: имитируем сложение чисел «столбиком»
   * Time complexity: O(m + n), где m и n – длина строк $a и $b
   */
  function stringSum(string $a, string $b) : string
  {
    // убеждаемся, что длина строки $a больше
    if (strlen($b) > strlen($a)) {
      [$a, $b] = [$b, $a];
    }

    $diff = strlen($a) - strlen($b);

    // результат сложения
    $result = '';

    // перенос
    $carry = 0;

    // идём с конца и складываем числа
    for($i = strlen($b) - 1; $i >= 0; $i--) {
      // сложение «столбиком»
      $sum = $a[$i + $diff] + $b[$i] + $carry;
      $result .= $sum % 10;
      $carry = intdiv($sum, 10);
    }

    // добавляем оставшиеся числа
    for($i = $diff - 1; $i >= 0; $i--) {
      $sum = $a[$i] + $carry;
      $result .= $sum % 10;
      $carry = intdiv($sum, 10);
    }

    // добавляем оставшийся перенос
    if ($carry > 0) {
      $result .= $carry;
    }

    // результат сложения – развернутая строка
    return strrev($result);
  }

  echo stringSum("999", "10");
  echo PHP_EOL;