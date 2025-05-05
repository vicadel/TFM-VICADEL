// Incluimos la librería necesaria para controlar servos con ESP32
#include <ESP32Servo.h>

// === Asignación de pines del ESP32 a cada dedo y la muñeca ===
#define LITTLEPIN 26   // Dedo meñique
#define RINGPIN   25   // Dedo anular
#define MIDDLEPIN 17   // Dedo medio
#define INDEXPIN  16   // Dedo índice
#define THUMBPIN  27   // Pulgar
#define WRISTPIN  14   // Muñeca (opcional, si quieres controlarla)

// === Declaración de los objetos servo ===
Servo servoLittle, servoRing, servoMiddle, servoIndex, servoThumb, servoWrist;

// === Configuración inicial ===
void setup() {
  Serial.begin(9600);  // Inicia la comunicación serie con el PC (Python)

  // Asocia cada objeto servo con el pin físico correspondiente
  servoLittle.attach(LITTLEPIN);
  servoRing.attach(RINGPIN);
  servoMiddle.attach(MIDDLEPIN);
  servoIndex.attach(INDEXPIN);
  servoThumb.attach(THUMBPIN);
  servoWrist.attach(WRISTPIN);  // Aunque no se use aún, está preparado

  // Abre todos los dedos al encender la prótesis
  openAll();
}

// === Bucle principal ===
void loop() {
  // Verifica si hay datos disponibles desde el puerto serie
  if (Serial.available()) {
    // Lee la cadena recibida hasta que encuentre un salto de línea '\n'
    String comando = Serial.readStringUntil('\n');
    comando.trim();  // Elimina espacios en blanco y saltos de línea

    // Si el comando empieza por "CLOSE_", se interpreta como cerrar un dedo
    if (comando.startsWith("CLOSE_")) {
      int canal = comando.substring(6).toInt();  // Extrae el número de dedo
      closeFinger(canal);  // Llama a la función que lo cierra
      Serial.println("🦾 Cerrando dedo " + String(canal));
    }

    // Si el comando empieza por "OPEN_", se interpreta como abrir un dedo
    else if (comando.startsWith("OPEN_")) {
      int canal = comando.substring(5).toInt();  // Extrae el número de dedo
      openFinger(canal);  // Llama a la función que lo abre
      Serial.println("✋ Abriendo dedo " + String(canal));
    }
  }
}

// === Función para abrir todos los dedos al mismo tiempo ===
void openAll() {
  openFinger(0);  // Meñique
  openFinger(1);  // Anular
  openFinger(2);  // Medio
  openFinger(3);  // Índice
  openFinger(4);  // Pulgar
}

// === Función para cerrar un dedo específico según su índice ===
void closeFinger(int i) {
  switch (i) {
    case 0: servoLittle.write(180); break;  // Cierra el meñique
    case 1: servoRing.write(0); break;      // Cierra el anular
    case 2: servoMiddle.write(0); break;    // Cierra el medio
    case 3: servoIndex.write(0); break;     // Cierra el índice
    case 4: servoThumb.write(180); break;   // Cierra el pulgar
  }
}

// === Función para abrir un dedo específico según su índice ===
void openFinger(int i) {
  switch (i) {
    case 0: servoLittle.write(0); break;     // Abre el meñique
    case 1: servoRing.write(180); break;     // Abre el anular
    case 2: servoMiddle.write(180); break;   // Abre el medio
    case 3: servoIndex.write(180); break;    // Abre el índice
    case 4: servoThumb.write(0); break;      // Abre el pulgar
  }
}
