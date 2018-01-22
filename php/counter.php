<?php
// $fp = fopen('files/counter.txt', 'c+');
// flock($fp, LOCK_EX);
//
// $count = (int)fread($fp, filesize('files/counter.txt'));
// ftruncate($fp, 0);
// fseek($fp, 0);
// fwrite($fp, $count + 1);
//
// flock($fp, LOCK_UN);
// fclose($fp);
//
// fclose($fp);
  // file_put_contents("files/counter.txt", file_get_contents("files/counter.txt", LOCK_EX) + 1, LOCK_EX);
// while(true) { include('/Users/maxflex/projects/algo/php/counter.php'); }