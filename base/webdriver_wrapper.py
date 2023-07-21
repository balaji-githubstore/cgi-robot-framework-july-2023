import pytest
from selenium import webdriver


class WebDriverListner:
    @pytest.fixture(scope="function", autouse=True)
    def setup(self):
        # Test Setup
        self.driver = webdriver.Chrome()
        self.driver.maximize_window()
        self.driver.implicitly_wait(10)
        self.driver.get("https://demo.openemr.io/b/openemr")
        yield
        # Test Teardown
        self.driver.quit()
