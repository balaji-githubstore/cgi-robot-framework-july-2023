import time

from behave import *
from selenium import webdriver
from selenium.webdriver.common.by import By
from assertpy import assert_that


@when(u'I click on patient menu')
def step_impl(context):
    context.driver.find_element(By.XPATH, "//div[normalize-space()='Patient']").click()


@when(u'I click on New/Search')
def step_impl(context):
    context.driver.find_element(By.XPATH, "//div[normalize-space()='New/Search']").click()


@when(u'I fill the patient details form')
def step_impl(context):
    context.driver.switch_to.frame(context.driver.find_element(By.XPATH,"//iframe[@name='pat']"))
    context.driver.find_element(By.XPATH, "//input[@id='form_fname']").send_keys(context.table[0]["firstname"])
    context.driver.find_element(By.XPATH, "//input[@id='form_lname']").send_keys(context.table[0]["lastname"])
    context.driver.find_element(By.XPATH, "//input[@id='form_DOB']").send_keys(context.table[0]["dob"])
    time.sleep(5)


@when(u'I click on create new patient')
def step_impl(context):
    print("hello")



@when(u'I close happy birthday pop if available')
def step_impl(context):
    print("hello")


@then(u'I should get the added patient name as "Medical Record Dashboard - john wick"')
def step_impl(context):
    print("hello")