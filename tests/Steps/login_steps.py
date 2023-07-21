from behave import *
from selenium import webdriver
from selenium.webdriver.common.by import By
from assertpy import assert_that


@given(u'I have browser with OpenEMR application')
def step_impl(context):
    context.driver = webdriver.Chrome()
    context.driver.maximize_window()
    context.driver.implicitly_wait(10)
    context.driver.get("https://demo.openemr.io/b/openemr")


@when(u'I enter username as "{text}"')
def step_impl(context, text):
    context.driver.find_element(By.CSS_SELECTOR, "#authUser").send_keys(text)


@when(u'I enter password as "{text}"')
def step_impl(context, text):
    context.driver.find_element(By.ID, "clearPass").send_keys(text)


@when(u'I select language as "{language}"')
def step_impl(context, language):
    print(language)


@when(u'I click on login')
def step_impl(context):
    context.driver.find_element(By.ID, "login-button").click()


@then(u'I should get access to portal with "{text}" title')
def step_impl(context, text):
    actual_title = context.driver.title
    assert_that(actual_title).is_equal_to(text)


@then(u'I should not get access to portal with "{text}" error')
def step_impl(context, text):
    actual_error = context.driver.find_element(By.XPATH, "//p[contains(text(),'Invalid')]").text
    assert_that(actual_error).is_equal_to(text)
