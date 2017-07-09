<?php
class Result implements Iterator, Countable {
	private $result;
    private $key = 0;
    private $count;

    public function Result($result) {
       if ($result instanceof mysqli_result === false)
          throw new InvalidArgumentException('Not valid MySQL result passed.');

        $this->result = $result;
        $this->count = mysqli_num_rows($this->result);
    }

    public function count() {
        return $this->count;
    }

    public function current() {
        return mysqli_fetch_object($this->result);
    }

    public function key() {
        return $this->key;
    }

    public function next() {
        $this->key++;
    }

    public function rewind() {
        if ($this->count() > 0)
            mysqli_data_seek($this->result, 0);

        $this->key = 0;
    }

    public function valid() {
        return $this->count() > $this->key;
    }
}