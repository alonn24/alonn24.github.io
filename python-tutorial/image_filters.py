import cv2 as cv

video = cv.VideoCapture(0)
subtractor = cv.createBackgroundSubtractorMOG2(20, 50)


def get_mask(frame): return cv.Canny(frame, 50, 150)


while True:
    ret, frame = video.read()
    if not ret:
        break
    cv.imshow('Mask', get_mask(frame))

    if cv.waitKey(1) & 0xFF == ord('q'):
        break
    elif cv.waitKey(1) & 0xFF == ord('t'):
        def get_mask(frame): return cv.threshold(
            cv.cvtColor(frame, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY)[1]
    elif cv.waitKey(1) & 0xFF == ord('b'):
        def get_mask(frame): return cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
    elif cv.waitKey(1) & 0xFF == ord('m'):
        def get_mark(frame): return subtractor.apply(frame)
    elif cv.waitKey(1) & 0xFF == ord('c'):
        def get_mask(frame): return cv.Canny(frame, 50, 50)
    elif cv.waitKey(1) & 0xFF == ord('s'):
        # Save the frame
        cv.imwrite('frame.png', get_mask(frame))


cv.destroyAllWindows()
video.release()
