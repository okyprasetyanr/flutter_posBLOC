**Note:** This project is currently **under active development**. Some features might change, and new components are still being added.
# Ringkas POS

> A Local-First, Highly Adaptive Mobile POS with Hybrid FIFO-FEFO Inventory & Intelligent Offline Sync

Ringkas POS is a mobile point-of-sale application designed to simplify daily business operations through a cleaner and more intuitive user experience. Built with a Local-First architecture, the application keeps checkout, inventory management, and receipt printing fully operational without an internet connection. Business data is stored locally and synchronized with the cloud on demand.

## 🔥 Core Engineering Superpowers

- **Hybrid FIFO-FEFO Inventory Engine:** Uses FIFO (First In, First Out) as the main inventory rule. When multiple identical items are available, they are prioritized using FEFO (First Expired, First Out) to help reduce expired product waste.
- **Intelligent Background Sync Worker:** Transaction data is first stored in a local Hive DB queue. If offline, the queue keeps the data safe and automatically syncs it to Firestore once the connection is restored. The synchronization process runs only when an internet connection is available.
- **Atomic Batch Sync:** All queued changes are sent in a single Firestore WriteBatch, and the local queue is cleared only after a successful sync to ensure data consistency.
- **Checklist-Based Role Permission:** A flexible permission system that lets store owners control which menus each staff member can access using a simple checklist.
- **Smart Adaptive Layout:** Uses a custom layout wrapper that automatically switches between `Column` in portrait mode and `Row` in landscape mode.
- **Seamless Dual-State Menu Switcher:** Lets users instantly switch between related menus (such as Sales ↔ Purchases) on the same page for faster operations.

## 🛠 System & Tech Stack

- **Database:** Isar DB for local data storage and Firebase Firestore for cloud backup and synchronization.
- **Offline Queue:** Hive DB manages pending synchronization tasks while the device is offline.
- **State Management:** BLOC and Streams provide reactive data updates across the app.
- **Hardware Integration:** Supports Bluetooth thermal printing using `bluetooth_print_plus` for seamless receipt printing.
- **Data Utilities:** Allows users to export and import reports directly through Excel.

## 🗺 Future Roadmap

- **Multi-Branch Cloud Sync:** Connect multiple store branches with real-time data synchronization and consolidated reports.
- **Automated Daily Reports:** Automatically send daily sales and business reports via WhatsApp or Email.