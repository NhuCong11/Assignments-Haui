<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>
    <link rel="stylesheet" href="./form.css">
</head>

<body>
    <?php
    if (isset($_POST['tinh'])) {
        $a = $_POST['a'];
        $b = $_POST['b'];
        $c = $a + $b;
    }

    ?>

    <div class="main">


        <form action="form.php" method="POST" class="form">
            <h3 class="heading">Tính tổng hai số</h3>

            <div class="spacer"></div>

            <div class="form-group">
                <label for="a" class="form-label">Số a:</label>
                <input id="a" name="a" type="text" class="form-control" value="<?php echo isset($a) ? $a : ''; ?>">
            </div>

            <div class="form-group">
                <label for="b" class="form-label">Số b:</label>
                <input id="b" name="b" type="text" class="form-control" value="<?php echo isset($b) ? $b : ''; ?>">
            </div>

            <div class="form-group">
                <label for="c" class="form-label">Kết quả</label>
                <input id="c" name="c" type="text" class="form-control result" value="<?php echo isset($c) ? $c : ''; ?>">
            </div>

            <input type="submit" value="Tính" name="tinh" class="form-submit">
            <input type="submit" value="Reset" name="xoa" class="form-submit">
        </form>

    </div>
</body>

</html>