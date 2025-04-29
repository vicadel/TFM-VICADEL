# 3D-Printed Myoelectric Prosthesis Controlled by EMG Signals with BITalino Sensorization

## 📚 Project Description

This repository contains the complete development of the **Master's Thesis (TFM)** titled:

> **Design, Fabrication, and Optimization of a 3D-Printed Myoelectric Prosthesis Controlled by EMG Signals with BITalino Sensorization**

Authored by **Víctor Alonso del Moral** for the **Master's Degree in Electronic Engineering** at the **Universidad Católica de Valencia (UCV)**.

The project involves the design, manufacturing, and experimental validation of a robotic upper-limb prosthesis controlled via electromyographic (EMG) signals using the **BITalino kit** and an **ESP32** microcontroller. 
The system integrates wireless communication, computer vision control through **OpenCV**, and is optimized for 3D printing in **PETG** material.

---

## 📂 Repository Structure

- **README.md**: Main documentation.
- **LICENSE**: GNU GPL v3.0 license for open use.
- **docs/**: Full technical documentation (report, appendices, diagrams, 3D models).
- **hardware/**: 3D models (STL), electronic schematics (Fritzing), electronic configurations.
- **software/**:
  - **Arduino/**: Code for ESP32 (servo control, EMG interpretation).
  - **Python/**: Scripts for EMG data acquisition from BITalino and vision-based gesture control (OpenCV).
- **tests/**: Functional validation test results.
- **designs/**: CAD files for modified and custom-designed parts.

---

## 🛠️ Technologies Used

- **Microcontroller**: ESP32 WeMos R32 D1
- **Signal Acquisition System**: BITalino (r)evolution Plugged Kit BLE
- **EMG Sensors**: Aoutecen
- **Servomotors**: MG996R
- **3D Design**: SolidWorks, Tinkercad
- **Manufacturing**: FDM 3D Printing (PETG)
- **3D Printing Software**: Ultimaker Cura
- **Programming**: Arduino IDE, Python (PySerial, OpenCV)
- **Circuit Modeling**: Fritzing

---

## 🚀 Installation and Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/vicadel/TFM-3D-Printed-Myoelectric-Prosthesis.git
   ```

2. Load the Arduino code:
   - Open Arduino IDE.
   - Select the `ESP32 Dev Module` board.
   - Upload the sketch from `software/Arduino/`.

3. Run the EMG acquisition system:
   - Install Python dependencies:
     ```bash
     pip install bitalino pyserial opencv-python
     ```
   - Run the EMG or vision control scripts from `software/Python/`.

4. Follow detailed instructions in `docs/memoria_TFM.pdf` for assembly, calibration, and testing.

---

## 📈 Project Status

✅ Mechanical design optimized  
✅ Functional EMG sensorization  
✅ Wireless control using ESP32  
✅ Gesture control via computer vision  
✅ Experimental validation completed

---

## 🔮 Future Work

- Integration of artificial intelligence for EMG gesture recognition.
- Development of a mobile app for calibration and control.
- Design of a custom PCB for system integration.
- Implementation of haptic feedback systems.

---

## 📜 License

This project is licensed under the **GNU General Public License v3.0**.  
See the `LICENSE` file for more details.

---

## 🙌 Acknowledgements

- Special thanks to **Vicent Girbés Juan** and **Irene Del Canto Serrano** for their technical and academic guidance.
- Thanks to the Open Source community for providing essential tools.
- Personal thanks to my family and friends for their constant support.

---

> Created with passion, dedication, and a drive for innovation. 🚀
