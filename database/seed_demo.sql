-- SIPINTAR-TI safe demo seed
-- File ini hanya berisi data kategori dan barang dummy.
-- Tidak ada akun user, password hash, credential hosting, atau data produksi.
-- Jika membutuhkan akun admin/peminjam untuk demo, buat melalui aplikasi atau ikuti instruksi di database/README.md.

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Presentasi', 'Peralatan presentasi'),
(2, 'Praktikum Jaringan', 'Peralatan jaringan komputer'),
(3, 'Praktikum IoT', 'Peralatan IoT dan embedded'),
(4, 'Dokumentasi', 'Peralatan dokumentasi'),
(5, 'Umum', 'Peralatan umum');

INSERT INTO `items` (`id`, `category_id`, `item_code`, `name`, `description`, `stock`, `item_condition`, `location`, `status`) VALUES
(1, 1, 'PRJ-001', 'Proyektor Epson', 'Proyektor ruang seminar', 5, 'baik', 'Lab Multimedia', 'available'),
(2, 1, 'HDMI-001', 'Kabel HDMI', 'Kabel HDMI 5 meter', 10, 'baik', 'Gudang Inventaris', 'available'),
(3, 2, 'RTR-001', 'Router Mikrotik', 'Router praktikum jaringan', 7, 'baik', 'Lab Jaringan', 'available'),
(4, 3, 'ARD-001', 'Arduino Uno', 'Board Arduino Uno R3', 15, 'baik', 'Lab IoT', 'available'),
(5, 4, 'CAM-001', 'Kamera Canon', 'Kamera dokumentasi kegiatan', 2, 'baik', 'Ruang Multimedia', 'available');
