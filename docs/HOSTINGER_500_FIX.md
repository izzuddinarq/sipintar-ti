# Perbaikan HTTP 500 di Hostinger

Jika ZAP menampilkan `Failed to attack the URL: received a 500 response code`, masalahnya bukan alert ZAP lagi, tetapi aplikasi gagal diload.

Langkah cek cepat:

1. Buka `https://domain/healthz.php`.
2. Jika `healthz.php` juga 500, periksa `.htaccess` atau versi PHP Hostinger.
3. Jika `healthz.php` normal tetapi halaman utama 500, periksa kredensial database di `config/database.php`.
4. Pastikan database sudah diimport dan tabel `login_attempts` sudah ada.

File `.htaccess` pada versi ini dibuat lebih konservatif agar lebih cocok dengan Hostinger/LiteSpeed.
