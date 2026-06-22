# Ringkas POS

Aplikasi POS(Point Of Sell)
Memiliki fitur yang mumpuni untuk kebutuhan kasir, mulai dari FIFO/FEFO/HYBRID, Responsif Mode (Landscape/Potrait), Backup/Restore menggunakan Excel, dan masih banyak kelebihannya.

## About Project

⚠️ **Note:** This project is currently **under active development**. Some features might change, and new components are still being added.

### Core Components

This project is built using a clean and modular architecture. It combines reactive state management, multiple storage solutions, and specialized tools to handle background tasks, charts, and hardware printing.

Here is how the components are organized:

#### 1. State Management & Logic
*   **BLoC**: The brain of the app. It separates the business logic from the user interface (UI) using **Events** (inputs) and **States** (outputs).

#### 2. Local & Remote Databases (Data Layer)
*   **Firestore**: The cloud database used to sync and store data online in real-time.
*   **Isar**: A super-fast, local NoSQL database used to store large amounts of structured data on the device.
*   **Hive**: A lightweight key-value database used for quick local storage, such as user settings or app preferences.

#### 3. Data Processing & Visualization
*   **Fl Chart**: A library used to create beautiful, interactive, and responsive graphs or charts.
*   **Excel**: Used to read, write, and export data into Excel spreadsheet files (`.xlsx`).

#### 4. Background Services & Hardware
*   **Work Manager**: Handles background tasks that need to run even when the app is closed or the device restarts.
*   **Esc Pos Utils Plus**: A specialized tool used to format and print receipts directly to thermal POS printers.

---

### 🔄 How They Work Together (Data Flow Example)

1. **User Action**: The user requests a sales report on the **UI**.
2. **Logic Process**: **BLoC** triggers a fetch event. It checks **Firestore** (online) or **Isar/Hive** (offline) for data.
3. **Data Display**: The retrieved data is sent back to the UI and visualized using **Fl Chart**.
4. **Action/Export**: The user can then export this data using **Excel** or print a physical receipt via **Esc Pos Utils Plus**.
5. **Syncing**: Meanwhile, **Work Manager** runs in the background to ensure all offline data is safely backed up to the cloud.
