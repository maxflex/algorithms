<?php
    // $test = new class() {
    //   public function __construct()
    //   {
    //     $this->a = 15;
    //     $this->b = 'test';
    //   }
    // };
    //
    // var_dump($test);


    $a = '1';
    $b = &$a;
    $b = "2$b";
    echo $a.", ".$b;