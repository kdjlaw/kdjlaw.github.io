<?php
header('content-type: application/json; charset=utf-8');
header("access-control-allow-origin: *");

$name = $_POST['name'];
$contact = $_POST['contact'];
$message = $_POST['message'];

//$to = 'kessler54@comcast.net';
$to = 'mjesuele@gmail.com';

$subject = 'Contact Form Submission - kdjlawoffice.com';
$message = 'From: '.$name."\nContact: ".$contact."\n\nMessage: ".$message;
$headers = 'From: "Kessler, DiGiovanni & Jesuele" <info@kdjlawoffice.com>';
 
//mail or die on error
mail($to, $subject, $message, $headers) or die('Error sending Mail');
//success message
echo http_response_code(200);
?>