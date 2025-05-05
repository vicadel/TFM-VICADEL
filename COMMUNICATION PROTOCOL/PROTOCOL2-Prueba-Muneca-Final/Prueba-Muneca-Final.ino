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


// Incluye la librería necesaria para controlar servos con ESP32
#include <ESP32Servo.h>

// Verificamos que estamos usando un ESP32 y definimos el pin D7 como GPIO 14
#ifdef ESP32
#define D7 14  // Definimos D7 como GPIO 14, que es donde conectamos el servo de la muñeca
#endif

// Declaramos un objeto "servo_wrist" para controlar el servomotor de la muñeca
Servo servo_wrist;

// Creamos un array con los ángulos máximos que queremos alcanzar en cada fase
// Cada valor representa una "fase" de movimiento del servo
int fases[] = {30, 60, 90, 120, 150, 180};

// Variable que indica en qué fase estamos actualmente (empezamos en la fase 0 -> 30°)
int fase_actual = 0;

void setup() {
  // Asociamos el objeto servo_wrist con el pin físico del ESP32 donde está conectado el servo
  // Esto inicializa la comunicación con el servo
  servo_wrist.attach(D7);
}

void loop() {
  // =============================
  // INICIO DE UNA NUEVA FASE
  // =============================

  // Obtenemos el ángulo máximo para esta fase, accediendo al índice correspondiente del array "fases"
  int max_angle = fases[fase_actual];

  // ========================================
  // Movimiento de subida: de 0° hasta max_angle
  // ========================================
  // Esta sección hace que el servo se mueva de manera suave desde 0° hasta el ángulo máximo definido en la fase
  for (int angle = 0; angle <= max_angle; angle++) {
    // Enviamos el ángulo actual al servo
    servo_wrist.write(angle);

    // Esperamos 15 milisegundos antes de cambiar al siguiente ángulo
    // Esto genera un efecto de movimiento suave en lugar de un salto brusco
    delay(15);
  }

  // ========================================
  // Espera en la posición máxima
  // ========================================
  // Una vez que llega al ángulo máximo, se queda ahí medio segundo antes de regresar
  delay(500);

  // ========================================
  // Movimiento de bajada: de max_angle hasta 0°
  // ========================================
  // Esta sección hace el camino de regreso del servo, moviéndose de forma suave de vuelta a 0°
  for (int angle = max_angle; angle >= 0; angle--) {
    // Enviamos cada ángulo decreciente al servo
    servo_wrist.write(angle);

    // Pequeña pausa entre cada paso para que el movimiento de regreso también sea suave
    delay(15);
  }

  // ========================================
  // Pausa entre fases
  // ========================================
  // Antes de pasar a la siguiente fase, esperamos 1 segundo
  delay(1000);

  // ========================================
  // Pasamos a la siguiente fase
  // ========================================
  // Aumentamos la variable "fase_actual" para que la próxima vez se use el siguiente ángulo en el array
  fase_actual++;

  // ========================================
  // Reinicio de fases
  // ========================================
  // Si ya completamos todas las fases (hasta 180°), reiniciamos para volver a empezar desde 30°
  if (fase_actual >= (sizeof(fases) / sizeof(fases[0]))) {
    fase_actual = 0;
  }

  // El ciclo se repetirá indefinidamente, ejecutando la siguiente fase cada vez que se ejecute loop()
}
