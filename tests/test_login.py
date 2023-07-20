import pytest
from assertpy import assert_that
from selenium import webdriver
from selenium.webdriver.common.by import By


class TestLoginUserInterface:
    @pytest.fixture(scope="function",autouse=True)
    def setup(self):
        #Test Setup
        self.driver = webdriver.Chrome()
        self.driver.maximize_window()
        self.driver.implicitly_wait(10)
        self.driver.get("https://demo.openemr.io/b/openemr")
        yield
        #Test Teardown
        self.driver.quit()

    def test_title(self):
        actual_title = self.driver.title
        assert_that(actual_title).is_equal_to("OpenEMR Login")

    def test_application_description(self):
        actual_desc = self.driver.find_element(By.XPATH,"//p[contains(text(),'most')]").text
        assert_that(actual_desc).contains("Electronic Health Record")