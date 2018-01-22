<?php

  // сколько в ноде может храниться записей
  // +1 на буфер
  // будет открыто K_WAY файлов параллельно
  define('NODE_MAX_ROWS', floor(RAM_SIZE / (K_WAY + 1)));

  class QueueNode
  {
    private $data = [];

    public function __construct(string $fileName)
    {
      $this->file = fopen($fileName, 'r');
    }

    public function next()
    {
        if (empty($this->data) && is_resource($this->file)) {
            $this->readData();
        }
        // if still empty
        if (empty($this->data)) {
          return null;
        }
        return array_shift($this->data);
    }

    private function readData()
    {
        $data = fread($this->file, NODE_MAX_ROWS * NODE_SIZE);
        if (feof($this->file)) {
            fclose($this->file);
        }
        $this->data = trim(explode(PHP_EOL, $data), PHP_EOL);
    }
  }


  /*
   * MinHeap
   */
  class PriorityQueue
  {
    public function __construct(array $nodes)
    {
      $this->nodes = $nodes;
      $this->buildMinHeap();
    }

    public function buildMinHeap()
    {

    }
  }