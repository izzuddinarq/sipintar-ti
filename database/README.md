# Database SIPINTAR-TI

Folder ini sengaja hanya menyimpan struktur database dan data dummy yang aman untuk repository publik. Dump penuh dari phpMyAdmin, data user asli, password hash, credential hosting, dan file `.env` tidak disertakan agar tidak memicu temuan SAST/secret scanning dan tidak membuka informasi sensitif.

## File

- `schema.sql`  
  Struktur tabel utama aplikasi: `users`, `categories`, `items`, `borrow_requests`, `borrow_details`, `audit_logs`, `security_events`, `sessions`, dan `login_attempts`.

- `seed_demo.sql`  
  Data dummy kategori dan barang. File ini tidak berisi akun user atau hash password.

- `2026_06_09_login_attempts.sql`  
  Migration tambahan untuk tabel pembatasan percobaan login. File ini dipertahankan untuk instalasi pada database lama yang belum memiliki tabel `login_attempts`.

## Cara instalasi database baru

1. Buat database baru melalui phpMyAdmin atau panel hosting.
2. Import `database/schema.sql`.
3. Import `database/seed_demo.sql` jika membutuhkan data contoh barang.
4. Sesuaikan konfigurasi koneksi database pada file konfigurasi lokal atau environment hosting.
5. Buat akun admin melalui proses aman, bukan dengan menyimpan hash password di repository publik.

## Membuat akun admin untuk demo

Gunakan PHP lokal untuk menghasilkan hash password:

```bash
php -r "echo password_hash('GANTI_PASSWORD_DEMO', PASSWORD_BCRYPT), PHP_EOL;"
```

Lalu jalankan SQL berikut di phpMyAdmin dengan mengganti nilai `<PASTE_HASH_DI_SINI>` menggunakan hash yang dihasilkan:

```sql
INSERT INTO users (name, email, password, role, identity_type, identity_number, is_active)
VALUES ('Administrator', 'admin@example.test', '<PASTE_HASH_DI_SINI>', 'admin', 'petugas', 'ADM001', 1);
```

Untuk akun peminjam, gunakan fitur daftar pada aplikasi agar alur registrasi, validasi input, hashing password, dan CSRF protection tetap diuji melalui aplikasi.

## Catatan keamanan

- Jangan commit file `.env`.
- Jangan commit dump database produksi.
- Jangan commit data user asli, NIM asli, email pribadi, password, token, atau API key.
- Jangan menyimpan hash password demo di repository jika tidak diperlukan.
- Jika akun demo dibutuhkan untuk presentasi, dokumentasikan sebagai akun lokal atau buat ulang dari lingkungan demo, bukan dari dump produksi.
