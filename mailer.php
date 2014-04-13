<?php
$name = $_POST['name'];
$contact = $_POST['contact'];
$message = $_POST['message'];

$to = 'mjesuele@gmail.com';

$subject = 'Contact Form Submission - kdjlawoffice.com';
$message = 'From: '.$name."\nContact: ".$contact."\n\nMessage: ".$message;
$headers = 'From: "Kessler, DiGiovanni & Jesuele" <info@kdjlawoffice.com>';
 
//mail or die on error
mail($to, $subject, $message, $headers) or die('Error sending Mail');
//success message
echo http_response_code(200);
?>