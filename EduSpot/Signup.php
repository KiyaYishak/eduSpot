<?php
// Database connection parameters
$serverName = "DESKTOP-HLSCRP\DDELL"; // Your SQL Server instance name
$connectionOptions = array(
    "Database" => "EduSpot", // Your database name
    "Uid" => "", // Replace with your SQL Server username
    "PWD" => ""  // Replace with your SQL Server password
);

// Establishes the connection
$conn = sqlsrv_connect($serverName, $connectionOptions);

if ($conn === false) {
    die(print_r(sqlsrv_errors(), true));
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fullname = $_POST['fullname'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $compassword = $_POST['compassword'];

    // Validate password and confirmation password
    if ($password !== $compassword) {
        die("Password and confirmation password do not match.");
    }

    // Hash the password
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Insert user data into the database
    $sql = "INSERT INTO Admin (Fullname, Username, Password) VALUES (?, ?, ?)";
    $params = array($fullname, $username, $hashed_password);

    $stmt = sqlsrv_query($conn, $sql, $params);

    if ($stmt === false) {
        die(print_r(sqlsrv_errors(), true));
    } else {
        echo "Register successful!";
    }

    // Close the connection
    sqlsrv_close($conn);
}
?>