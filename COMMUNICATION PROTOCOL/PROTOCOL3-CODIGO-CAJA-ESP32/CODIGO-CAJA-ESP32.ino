//Script to control InMoov Arm using Aoutecen EMG Muscle Sensor V3 from Advancer Technologies
//by Victor Alonso (vicadel@alumni.uv.es)
//Valencia (Spain)
//Juny 2025
//Part of TFG 3D Prostetic Hand & Forarm - InMoov Project 

//For information about Aoutecen EMG Muscle Sensor V3 board, manual and other resources, please visit:
//https://www.tme.eu/Document/8732078ad54d82f6b49c5284341026b5/POLOLU-2726.pdf


/* * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details. 
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * */


// === Librerías necesarias ===
#include <ESP32Servo.h>  // Para controlar servos con ESP32

// === Definición de pines ===
#define D2 26  // Pulgar
#define D3 25  // Índice
#define D4 17  // Medio
#define D5 16  // Anular
#define D6 27  // Meñique

#define D7 14  // (Reservado para la muñeca si se usa)

#define RLED 12   // LED rojo
#define BLED 13   // LED azul
#define PUSH 8    // Botón pulsador rojo
#define SWITCH 9  // Interruptor de modo

#define RXD1 10   // Bluetooth RX (conectado al TX del módulo)
#define TXD1 11   // Bluetooth TX (conectado al RX del módulo)

// === Objetos servo con nombres reutilizados ===
Servo servo_thumb;    // Pulgar
Servo servo_index;    // Índice
Servo servo_middle;   // Medio
Servo servo_ring;     // Anular
Servo servo_pinky;    // Meñique

// === Variables para guardar la posición actual de cada dedo ===
int ThumbPos = 45;
int IndexPos = 45;
int MiddlePos = 45;
int RingPos = 45;
int LittlePos = 45;

// === Velocidades de movimiento ===
int fingerSpeed = 20;  // Velocidad para dedos individuales
int HandSpeed = 20;    // Velocidad para toda la mano

void setup() {
  // Inicializamos el puerto serie para Bluetooth en UART1
  Serial1.begin(9600, SERIAL_8N1, RXD1, TXD1);  // RX, TX

  // Configuramos pines de LED y botones
  pinMode(RLED, OUTPUT);
  pinMode(BLED, OUTPUT);
  pinMode(PUSH, INPUT_PULLUP);
  pinMode(SWITCH, INPUT_PULLUP);

  // Asociamos cada servo a su pin correspondiente
  servo_thumb.attach(D2);
  servo_index.attach(D3);
  servo_middle.attach(D4);
  servo_ring.attach(D5);
  servo_pinky.attach(D6);

  // Inicializamos todos los dedos en posición neutral (45°)
  servo_thumb.write(ThumbPos);
  servo_index.write(IndexPos);
  servo_middle.write(MiddlePos);
  servo_ring.write(RingPos);
  servo_pinky.write(LittlePos);

  // Apagamos ambos LEDs al inicio
  digitalWrite(RLED, LOW);
  digitalWrite(BLED, LOW);
}

void loop() {
  // Leemos el estado del interruptor
  int ProgSwitch = digitalRead(SWITCH);

  // Si el switch está en modo pulsador
  if (ProgSwitch == 0) {
    PUSH_BUTTON();
    digitalWrite(RLED, LOW);
    digitalWrite(BLED, HIGH);
  }
  // Si el switch está en modo Bluetooth
  else {
    BLUETOOTH();
    digitalWrite(RLED, HIGH);
    digitalWrite(BLED, LOW);
  }
}

// === Función para controlar los dedos con el botón físico ===
void PUSH_BUTTON() {
  int PushState = digitalRead(PUSH);

  if (PushState == 0) {
    // Si todos los dedos están en 45°, los cerramos
    if (ThumbPos == 45 && IndexPos == 45 && MiddlePos == 45 && RingPos == 45 && LittlePos == 45) {
      for (int i = 45; i <= 150; i++) {
        servo_index.write(i);
        servo_middle.write(i);
        servo_ring.write(i);
        servo_pinky.write(i);

        IndexPos = i;
        MiddlePos = i;
        RingPos = i;
        LittlePos = i;

        delay(HandSpeed);
      }

      for (int i = 45; i <= 150; i++) {
        servo_thumb.write(i);
        ThumbPos = i;
        delay(HandSpeed);
      }
    }
    // Si todos los dedos están cerrados (150°), los abrimos
    else if (ThumbPos == 150 && IndexPos == 150 && MiddlePos == 150 && RingPos == 150 && LittlePos == 150) {
      for (int i = 150; i >= 45; i--) {
        servo_thumb.write(i);
        ThumbPos = i;
        delay(HandSpeed);
      }

      for (int i = 150; i >= 45; i--) {
        servo_index.write(i);
        servo_middle.write(i);
        servo_ring.write(i);
        servo_pinky.write(i);

        IndexPos = i;
        MiddlePos = i;
        RingPos = i;
        LittlePos = i;

        delay(HandSpeed);
      }
    }
  }
  else {
    // Si no se pulsa, los dedos se mantienen en su posición actual
    servo_thumb.write(ThumbPos);
    servo_index.write(IndexPos);
    servo_middle.write(MiddlePos);
    servo_ring.write(RingPos);
    servo_pinky.write(LittlePos);
  }
}

// === Función para controlar la mano por Bluetooth ===
void BLUETOOTH() {
  if (Serial1.available()) {
    char data = Serial1.read();  // Lee el carácter recibido

    // === Control por letra recibida ===
    if (data == 'T') toggleFinger(servo_thumb, ThumbPos);
    else if (data == 'I') toggleFinger(servo_index, IndexPos);
    else if (data == 'M') toggleFinger(servo_middle, MiddlePos);
    else if (data == 'R') toggleFinger(servo_ring, RingPos);
    else if (data == 'L') toggleFinger(servo_pinky, LittlePos);

    // === Comando 'H' para abrir/cerrar toda la mano ===
    else if (data == 'H') {
      if (ThumbPos == 45 && IndexPos == 45 && MiddlePos == 45 && RingPos == 45 && LittlePos == 45) {
        // Cerramos todos los dedos menos el pulgar
        for (int i = 45; i <= 150; i++) {
          servo_index.write(i);
          servo_middle.write(i);
          servo_ring.write(i);
          servo_pinky.write(i);
          IndexPos = i;
          MiddlePos = i;
          RingPos = i;
          LittlePos = i;
          delay(HandSpeed);
        }

        // Luego cerramos el pulgar
        for (int i = 45; i <= 150; i++) {
          servo_thumb.write(i);
          ThumbPos = i;
          delay(HandSpeed);
        }
      }
      else if (ThumbPos == 150 && IndexPos == 150 && MiddlePos == 150 && RingPos == 150 && LittlePos == 150) {
        // Abrimos primero el pulgar
        for (int i = 150; i >= 45; i--) {
          servo_thumb.write(i);
          ThumbPos = i;
          delay(HandSpeed);
        }

        // Luego el resto de dedos
        for (int i = 150; i >= 45; i--) {
          servo_index.write(i);
          servo_middle.write(i);
          servo_ring.write(i);
          servo_pinky.write(i);
          IndexPos = i;
          MiddlePos = i;
          RingPos = i;
          LittlePos = i;
          delay(HandSpeed);
        }
      }
      else {
        Serial1.println("Err: Position of all fingers are not same");
      }
    }
  }
}

// === Función auxiliar para abrir/cerrar un dedo desde Bluetooth ===
void toggleFinger(Servo &servo, int &pos) {
  if (pos == 45) {
    for (int i = 45; i <= 150; i++) {
      servo.write(i);
      pos = i;
      delay(fingerSpeed);
    }
  } else {
    for (int i = 150; i >= 45; i--) {
      servo.write(i);
      pos = i;
      delay(fingerSpeed);
    }
  }
}
