<?php
class DataBase {
	private static $self;
   private $conn;

   private function DataBase() {
   }
   public static function getInstance() {
      if (is_null(self::$self))
         self::$self = new DataBase();

      return self::$self;
   }
   public function connect($host, $name, $pass, $db) {
      if (!is_null($this->conn))
         return ;
      $this->conn = mysqli_connect($host, $name, $pass, $db);
      if (mysqli_connect_errno())
      {
         echo "Failed to connect to MySQL: " . mysqli_connect_error();
         throw new Exception('Unable to connect to database: ' +  mysqli_connect_error());
      }

      if (mysqli_select_db($this->conn, $db) === false)
         throw new Exception('Unable to select database');
   }
   public function disconnect() {
      if (mysqli_close($this->conn) === false)
         throw new Exception('Unable to disconnect from server.');

      unset($this->conn);
   }
   public function query($sql) {
      if (($temp = mysqli_query($this->conn, $sql)) === false)
         throw new Exception(sprintf('Unable to execute SQL query `%s`.', $sql));

      if ($temp === true)
         return true;

      return new Result($temp);
   }
}