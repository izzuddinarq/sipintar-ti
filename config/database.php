<?php
/**
 * Database connection.
 *
 * Di Hostinger, isi kredensial DB di file ini atau lewat environment variable.
 * File ini tidak lagi menghentikan halaman publik dengan HTTP 500 saat koneksi DB gagal.
 * Halaman yang membutuhkan DB tetap harus mengecek $conn sebelum menjalankan query.
 */
if (basename($_SERVER['SCRIPT_FILENAME'] ?? '') === basename(__FILE__)) {
    http_response_code(403);
    exit('403 Forbidden');
}

$host = getenv('DB_HOST') ?: 'localhost';
$user = getenv('DB_USER') ?: 'root';
$pass = getenv('DB_PASS') ?: '';
$db   = getenv('DB_NAME') ?: 'sipintar_ti';

$conn = null;
$db_connection_error = null;

if (!function_exists('mysqli_connect')) {
    $db_connection_error = 'Ekstensi PHP mysqli belum aktif.';
    error_log('Database connection failed: mysqli extension is not enabled.');
} else {
    mysqli_report(MYSQLI_REPORT_OFF);
    $conn = @mysqli_connect($host, $user, $pass, $db);

    if (!$conn) {
        $db_connection_error = mysqli_connect_error();
        error_log('Database connection failed: ' . $db_connection_error);
        $conn = null;
    } else {
        mysqli_set_charset($conn, 'utf8mb4');
    }
}
?>
