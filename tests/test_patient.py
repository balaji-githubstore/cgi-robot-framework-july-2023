from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select

from base.webdriver_wrapper import WebDriverListner
from pages.login_page import LoginPage


class TestPatient(WebDriverListner):
    def test_add_valid_patient(self):

        login_page = LoginPage(self.driver)
        login_page.enter_username("admin")
        login_page.enter_password("pass")
        login_page.select_language("English (Indian)")
        login_page.click_login()


