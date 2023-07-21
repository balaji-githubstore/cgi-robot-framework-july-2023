"""Can handle all common menu and other elements"""


class MainPage:

    def __init__(self, driver):
        self.driver = driver

    @property
    def get_main_page_title(self):
        return self.driver.title
