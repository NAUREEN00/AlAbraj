<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <?php require('inc/links.php'); ?>
  <title><?php echo $settings_r['site_title'] ?> - PACKAGES</title>
  <style>
    .pop:hover {
      border-top-color: var(--teal) !important;
      transform: scale(1.03);
      transition: all 0.3s;
    }
    .package-img {
      max-height: 200px;
      object-fit: cover;
    }
  </style>
</head>
<body class="bg-light">

  <?php require('inc/header.php'); ?>

  <div class="my-5 px-4">
    <h2 class="fw-bold h-font text-center">Our Packages</h2>
    <div class="h-line bg-dark"></div>
    <p class="text-center mt-3">
      Explore our tailored packages for Hajj, Umrah, and Brunei tours, with options for every preference and budget.
    </p>
  </div>

  <div class="container">
    <div class="row">
      <?php 
        // Fetch all packages from the database
        $res = selectAll('packages');
        $path = 'images/packages/'; // Path to package images

        while($row = mysqli_fetch_assoc($res)) {
          echo <<<data
            <div class="col-lg-4 col-md-6 mb-5 px-4">
              <div class="bg-white rounded shadow p-4 border-top border-4 border-dark pop">
                <img src="{$path}{$row['image']}" class="w-100 package-img mb-3" alt="{$row['name']}">
                <h5 class="fw-bold mb-3">{$row['name']}</h5>
                <p><strong>Description:</strong> {$row['description']}</p>
                <p><strong>Duration:</strong> {$row['duration']}</p>
                <p><strong>Features:</strong> {$row['features']}</p>
                <p class="text-success"><strong>Price:</strong> BND {$row['price']}</p>
              </div>
            </div>
          data;
        }
      ?>
    </div>
  </div>

  <?php require('inc/footer.php'); ?>

</body>
</html>
