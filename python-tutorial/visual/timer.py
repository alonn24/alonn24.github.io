import time


class Timer(object):
    """Using tic and toc, we can conveniently measure lapses in time"""

    def __init__(self) -> None:
        self.time = time.time()

    def tic(self) -> None:
        """Tic esentially resets the timer"""
        self.time = time.time()

    def toc(self, restart_timer=True) -> float:
        """Toc gives us the elapsed time, and usually resets the time unless otherwise indicated"""
        elapsed_time = time.time() - self.time
        if restart_timer:
            self.tic()
        return elapsed_time
