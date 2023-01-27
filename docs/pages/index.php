<?php

declare(strict_types=1);

$srcDir = realpath("{$_SERVER['DOCUMENT_ROOT']}/../../src");

$ids = array_diff(scandir($srcDir), ['.', '..']);

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>Community devcontainer features</title>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
</head>

<body>

  <h1>Community devcontainer features</h1>

  <ul>
    <?php foreach ($ids as $id): ?>
      <li>
        <?="<a href='$id'>$id</a>" ?>
      </li>
    <?php endforeach; ?>
  </ul>

  <p>You can find out more on <a href="https://github.com/devcontainers-contrib/features#readme">GitHub</a></p>

</body>

</html>
