import pytest
from assertpy import assert_that
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select

from base.webdriver_wrapper import WebDriverListner
from pages.login_page import LoginPage
from pages.main_page import MainPage
from utilities.data_source import DataSource


class TestLoginUserInterface(WebDriverListner):
    @pytest.mark.smoke
    @pytest.mark.ui
    def test_title(self):
        actual_title = self.driver.title
        assert_that(actual_title).is_equal_to("OpenEMR Login")

    @pytest.mark.ui
    def test_application_description(self):
        actual_desc = self.driver.find_element(By.XPATH, "//p[contains(text(),'most')]").text
        assert_that(actual_desc).contains("Electronic Health Record")


class TestLogin(WebDriverListner):

    @pytest.mark.login
    @pytest.mark.parametrize("username,password,language,expected_title",
                             DataSource.valid_login_data)
    def test_valid_login(self, username, password, language, expected_title):
        login_page = LoginPage(self.driver)
        login_page.enter_username(username)
        login_page.enter_password(password)
        login_page.select_language(language)
        login_page.click_login()
        main_page = MainPage(self.driver)
        assert_that(main_page.get_main_page_title).is_equal_to(expected_title)

    @pytest.mark.login
    @pytest.mark.parametrize("username,password,language,expected_error",
                             DataSource.invalid_login_data)
    def test_invalid_login(self, username, password, language, expected_error):
        login_page = LoginPage(self.driver)
        login_page.enter_username(username)
        login_page.enter_password(password)
        login_page.select_language(language)
        login_page.click_login()

        actual_error = login_page.get_error_message()
        assert_that(actual_error).is_equal_to(expected_error)
