<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <?php require('inc/links.php'); ?>
  <title><?php echo $settings_r['site_title']; ?> - CONFIRM BOOKING</title>
</head>
<body class="bg-light">

  <?php require('inc/header.php'); ?>

  <?php 
    // Validate room ID and check for shutdown mode
    if(!isset($_GET['id']) || $settings_r['shutdown'] == true) {
      redirect('rooms.php');
    }

    // Validate user session
    if(!(isset($_SESSION['login']) && $_SESSION['login'] == true)) {
      redirect('rooms.php');
    }

    // Fetch room details
    $data = filteration($_GET);
    $room_res = select("SELECT * FROM rooms WHERE id=? AND status=? AND removed=?", [$data['id'], 1, 0], 'iii');

    if(mysqli_num_rows($room_res) == 0) {
      redirect('rooms.php');
    }

    $room_data = mysqli_fetch_assoc($room_res);

    // Store room details in session
    $_SESSION['room'] = [
      "id" => $room_data['id'],
      "name" => $room_data['name'],
      "price" => $room_data['price']
    ];

    // Fetch user details
    $user_res = select("SELECT * FROM user_cred WHERE id=? LIMIT 1", [$_SESSION['uId']], "i");
    $user_data = mysqli_fetch_assoc($user_res);
  ?>

  <div class="container">
    <div class="row">
      <div class="col-12 my-5 mb-4 px-4">
        <h2 class="fw-bold">CONFIRM BOOKING</h2>
        <div style="font-size: 14px;">
          <a href="index.php" class="text-secondary text-decoration-none">HOME</a>
          <span class="text-secondary"> > </span>
          <a href="rooms.php" class="text-secondary text-decoration-none">TOURS</a>
          <span class="text-secondary"> > </span>
          <a href="#" class="text-secondary text-decoration-none">CONFIRM</a>
        </div>
      </div>

      <div class="col-lg-7 col-md-12 px-4">
        <?php 
          $room_thumb = 'hbwebsite/images/rooms/thumbnail';
          $thumb_q = mysqli_query($con, "SELECT * FROM room_images WHERE room_id='{$room_data['id']}' AND thumb='1'");
          if(mysqli_num_rows($thumb_q) > 0) {
            $thumb_res = mysqli_fetch_assoc($thumb_q);
            $room_thumb = ROOMS_IMG_PATH . $thumb_res['image'];
          }
          echo<<<data
            <div class="card p-3 shadow-sm rounded">
              <img src="$room_thumb" class="img-fluid rounded mb-3">
              <h5>$room_data[name]</h5>
              <h6>B$$room_data[price]</h6>
            </div>
          data;
        ?>
      </div>

      <div class="col-lg-5 col-md-12 px-4">
        <div class="card mb-4 border-0 shadow-sm rounded-3">
          <div class="card-body">
            <form method="POST">
              <h6 class="mb-3">BOOKING DETAILS</h6>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label class="form-label">Name</label>
                  <input name="name" type="text" value="<?php echo $user_data['name']; ?>" class="form-control shadow-none" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label class="form-label">Phone Number</label>
                  <input name="phonenum" type="number" value="<?php echo $user_data['phonenum']; ?>" class="form-control shadow-none" required>
                </div>
                <div class="col-md-12 mb-3">
                  <label class="form-label">Address</label>
                  <textarea name="address" class="form-control shadow-none" rows="1" required><?php echo $user_data['address']; ?></textarea>
                </div>
                <div class="col-md-6 mb-3">
                  <label class="form-label">Check-in</label>
                  <input name="checkin" type="date" class="form-control shadow-none" required>
                </div>
                <div class="col-md-6 mb-4">
                  <label class="form-label">Check-out</label>
                  <input name="checkout" type="date" class="form-control shadow-none" required>
                </div>
                <div class="col-12">
                  <button name="pay_now" class="btn w-100 text-white custom-bg shadow-none mb-1">Confirm Booking</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <?php 
    if (isset($_POST['pay_now'])) {
      $checkin = $_POST['checkin'];
      $checkout = $_POST['checkout'];
      $name = $_POST['name'];
      $phonenum = $_POST['phonenum'];
      $address = $_POST['address'];
    
      // Booking amount equals room price
      $amount = $room_data['price'];
    
      // Insert into booking_order table
      $order_id = 'ORDER_' . uniqid();
      $order_query = "INSERT INTO booking_order (user_id, order_id, room_id, trans_amt, booking_status, datentime) VALUES (?, ?, ?, ?, 'confirmed', NOW())";
      $stmt_order = $con->prepare($order_query);
      $stmt_order->bind_param("isid", $_SESSION['uId'], $order_id, $room_data['id'], $amount);
      $stmt_order->execute();
      $booking_order_id = $stmt_order->insert_id;
    
      // Insert into booking_detail table
      $detail_query = "INSERT INTO booking_details (booking_id, room_name, price, total_pay, room_no, user_name, phonenum, address) 
                       VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
      $total_pay = $amount; // Assuming price is the total payment for now
      $stmt_detail = $con->prepare($detail_query);
      $stmt_detail->bind_param("ssdiisss", $booking_order_id, $room_data['name'], $room_data['price'], $total_pay, $room_data['id'], $name, $phonenum, $address);
      $stmt_detail->execute();
    
      // Redirect on success
      if ($stmt_order && $stmt_detail) {
        echo "<script>alert('Booking Confirmed!'); window.location.href='bookings.php';</script>";
      } else {
        echo "<script>alert('Booking Failed!');</script>";
      }
    }
  ?>

  <?php require('inc/footer.php'); ?>
</body>
</html>
