from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select

from base.webdriver_wrapper import WebDriverListner


class TestPatient(WebDriverListner):
    def test_add_valid_patient(self):
        self.driver.find_element(By.ID, "authUser").send_keys("admin")
        self.driver.find_element(By.ID, "clearPass").send_keys("pass")
        select_language = Select(self.driver.find_element(By.XPATH, "//select[@name='languageChoice']"))
        select_language.select_by_visible_text("English (Indian)")
        self.driver.find_element(By.ID, "login-button").click()


