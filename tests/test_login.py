import pytest
from assertpy import assert_that
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select

from base.webdriver_wrapper import WebDriverListner


class TestLoginUserInterface(WebDriverListner):
    def test_title(self):
        actual_title = self.driver.title
        assert_that(actual_title).is_equal_to("OpenEMR Login")

    def test_application_description(self):
        actual_desc = self.driver.find_element(By.XPATH, "//p[contains(text(),'most')]").text
        assert_that(actual_desc).contains("Electronic Health Record")


class TestLogin(WebDriverListner):

    def test_valid_login(self):
        self.driver.find_element(By.ID, "authUser").send_keys("admin")
        self.driver.find_element(By.ID,"clearPass").send_keys("pass")
        select_language=Select(self.driver.find_element(By.NAME,"languageChoice"))
        select_language.select_by_visible_text("English (Indian)")
        self.driver.find_element(By.ID,"login-button").click()
        assert_that(self.driver.title).is_equal_to("OpenEMR")


