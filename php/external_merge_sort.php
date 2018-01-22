<?php

  define('FILE_MAIN', 'main');
  define('RAM_SIZE', 1024); // RAM SIZE IN BYTES
  define('ROW_SIZE', 31);   // размер 1 строки в файле
  define('K_WAY', 10);      // по сколько сортировать забеги

  // RAM 1КБ (1024 байт)
  // файл из 1000 строк весит 30КБ (30999 байт)
  //
  // считываем файл по 1кб, сортируем
  // получится ~30 временных файлов
  // забеги делаем по 10 (10-way merge sort)
  // после 1 забега получится 3 временных файла
  // после 2 забега получаем исходный файл

  function memoryUsage()
  {
    printf("Memory usage: %s\n", memory_get_usage());
  }

  function filePath(string $filename = FILE_MAIN) : string
  {
    return "files/{$filename}.txt";
  }

  /**
   * runs 1-n
   */
   function mergeChunks()
   {

   }

  /**
   * run 0
   */
  function createSortedChunks()
  {
    $filesize = filesize(filePath(FILE_MAIN));
    $f = fopen(filePath(FILE_MAIN), 'r');
    $chunk = 0;

    // how many rows can be read at a time
    // in byes
    $maxRowsSizePerRun = floor(RAM_SIZE / ROW_SIZE) * ROW_SIZE;

    while (! feof($f)) {
      $chunk++;
      $data = fread($f, $maxRowsSizePerRun);
      $rows = explode(PHP_EOL, trim($data, PHP_EOL));
      sort($rows);
      $chunkFile = fopen(filePath("chunk_{$chunk}"), 'w');
      fwrite($chunkFile, implode(PHP_EOL, $rows));
      fclose($chunkFile);
    }
    memoryUsage();
  }

  function createFile(int $rows = 10)
  {
    $t1 = microtime(true);
    $f = fopen(filePath(FILE_MAIN), 'w');
    foreach(range(1, $rows) as $i) {
      // 0087645544 2015-01-03 11:05:06
      // $id = rand(1, 999999999);
      $id   = rand(1, 20) * 100000000;
      $date = date("Y-m-d H:i:s", rand(1420070400, 1514764800));
      fwrite($f, sprintf("%010d %s" . ($i == $rows ? '' : PHP_EOL), $id, $date));
    }
    fclose($f);
    $fileSize = filesize(filePath(FILE_MAIN));
    printf("File of %s rows created in %.2fs, file size: %s bytes\n", $rows, microtime(true) - $t1, $fileSize);
    return $fileSize;
  }

  // @test
  // 100 000 rows
  // fgets: 0.012 - 0.014
  // fread: 0.002 – 0.004
  //
  // 1 000 000 rows
  // fgets: 0.11 – 0.13
  // fread: 0.024 – 0.026
  function readF($bytes)
  {
    $t1 = microtime(true);
    $bytesRead = 0;
    $f = fopen(filePath(FILE_MAIN), 'r');
    fread($f, $bytes);
    // $lines = explode(PHP_EOL, $lines);
    // $lines = [];
    // while (! feof($f)) {
    //   // $lines[] = fgets($f);
    //   fgets($f);
    // }
    fclose($f);
    printf("%d bytes read in %.4fs\n", $bytes, microtime(true) - $t1);
  }

  // $fileSize = createFile(1000);
  // readF(filesize(filePath(FILE_MAIN)));
  memoryUsage();
  createSortedChunks();