<html lang="en">
  <head>
    <title>Участники соревнований по боксу</title>
    <link rel="stylesheet" href="style.css" type="text/css" />
  </head>
  <body>
    <h1>Финалисты и призеры первенства</h1>
    <table>
      <tr>
        <th>Имя</th>
        <th>Город</th>
        <th>Место</th>
      </tr>
      <?php
				$mysqli = new mysqli("db", "user", "password", "reg1");
				$result = $mysqli->query("SELECT * FROM regions"); foreach ($result as $row) {
      echo "
      <tr>
        <td>{$row['region']}</td>
        <td>{$row['maincity']}</td>
        <td>{$row['population']}</td>
      </tr>
      "; } ?>
    </table>
    <?php
			phpinfo();
		?>
  </body>
</html>

