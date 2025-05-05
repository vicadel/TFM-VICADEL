import cvzone
import cv2

cap = cv2.VideoCapture(0)
cap.set(3, 1280)
cap.set(4, 720)
detector = cvzone.HandDetector(maxHands=1, detectionCon=1)
mySerial = cvzone.SerialObject("COM3", 115200, 1)

while True:
    success, img = cap.read()
    if not success:
        continue

    img = detector.findHands(img)
    lmList, bbox = detector.findPosition(img)

    if lmList:
        fingers = detector.fingersUp()

        # Invertir valores: ahora 5 representa mano abierta y 0 mano cerrada
        fingers = [1 - f for f in fingers]
        totalFingers = 5 - fingers.count(1)  # Invierte el conteo de dedos

        # Detección de mano derecha o izquierda
        myHandType = detector.handType()

        # Mostrar información en pantalla
        cv2.putText(img, f'Fingers: {totalFingers}', (50, 50),
                    cv2.FONT_HERSHEY_PLAIN, 2, (0, 255, 0), 2)
        cv2.putText(img, f'Hand: {myHandType}', (50, 100),
                    cv2.FONT_HERSHEY_PLAIN, 2, (0, 255, 255), 2)

        print(fingers)
        mySerial.sendData(fingers)  # Enviar datos a la ESP32

    cv2.imshow("Image", img)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
