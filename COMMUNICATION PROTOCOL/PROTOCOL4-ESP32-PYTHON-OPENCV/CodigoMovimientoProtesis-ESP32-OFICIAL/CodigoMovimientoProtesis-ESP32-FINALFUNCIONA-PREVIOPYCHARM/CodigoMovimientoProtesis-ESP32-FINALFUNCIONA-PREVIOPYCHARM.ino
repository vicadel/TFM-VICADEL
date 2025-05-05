// Incluye la librería ESP32Servo que permite controlar servomotores con un ESP32
#include <ESP32Servo.h>

// Definición de pines analógicos y digitales para el ESP32
#ifdef ESP32    

// Pines analógicos A0 - A7
#define A0 2
#define A1 4
#define A2 35
#define A3 34
#define A4 36
#define A5 39
#define A6 32
#define A7 33

// Pines digitales D2 - D13
#define D2 26
#define D3 25
#define D4 17
#define D5 16
#define D6 27
#define D7 14
#define D8 12
#define D9 13
#define D10 5
#define D11 23
#define D12 19
#define D13 18
#endif

// Definición de constantes para la comunicación serie
#define numOfValsRec 5   // Número de valores a recibir (uno por cada dedo)
#define digitsPerValRec 1 // Número de dígitos por valor

// Declaración de servos para cada dedo
Servo servoThumb;
Servo servoIndex;
Servo servoMiddle;
Servo servoRing;
Servo servoPinky;

// Variables para almacenar los valores recibidos
int valsRec[numOfValsRec];  // Array donde se almacenan los valores recibidos
int stringLength = numOfValsRec * digitsPerValRec + 1; // Longitud del mensaje recibido (Ejemplo: "$00000")
int counter = 0;         // Contador de caracteres recibidos
bool counterStart = false; // Indica si la recepción ha comenzado
String receivedString;    // Almacena el mensaje recibido

// Configuración inicial en setup()
void setup() {
    Serial.begin(9600);  // Inicia la comunicación serial a 9600 baudios

    // Asigna pines digitales a cada servo
    servoThumb.attach(D2);
    servoIndex.attach(D3);
    servoMiddle.attach(D4);
    servoRing.attach(D5);
    servoPinky.attach(D6);
}

// Función para recibir datos desde el Monitor Serie
void receiveData() {
    while (Serial.available()) // Si hay datos en el puerto serie
    {
        char c = Serial.read(); // Lee un carácter

        if (c == '$') {  // Si el carácter es '$', inicia la recepción de datos
            counterStart = true;
        }
        
        if (counterStart) { // Si la recepción ha iniciado
            if (counter < stringLength) { // Si aún faltan caracteres por recibir
                receivedString = String(receivedString + c); // Almacena el dato recibido
                counter++;
            }
        }
        
        if (counter >= stringLength) { // Cuando el mensaje está completo
            for (int i = 0; i < numOfValsRec; i++) // Extrae valores de los dedos
            {
                int num = (i * digitsPerValRec) + 1;
                valsRec[i] = receivedString.substring(num, num + digitsPerValRec).toInt();
            }
            receivedString = ""; // Borra la cadena recibida
            counter = 0;  // Reinicia el contador
            counterStart = false; // Indica que se ha terminado la recepción
        }
    }
}

// Bucle principal
void loop() {
    receiveData();  // Llama a la función que recibe los datos desde el puerto serie

    // Control de los servos según los valores recibidos
    if (valsRec[0] == 1) {servoThumb.write(180);} else {servoThumb.write(0);}  // Pulgar
    if (valsRec[1] == 1) {servoIndex.write(180);} else {servoIndex.write(0);}  // Índice
    if (valsRec[2] == 1) {servoMiddle.write(180);} else {servoMiddle.write(0);}  // Medio
    if (valsRec[3] == 1) {servoRing.write(180);} else {servoRing.write(0);}  // Anular
    if (valsRec[4] == 1) {servoPinky.write(180);} else {servoPinky.write(0);}  // Meñique
}
