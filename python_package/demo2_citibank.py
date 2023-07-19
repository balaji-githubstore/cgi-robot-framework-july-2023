import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select

driver=webdriver.Chrome()
driver.maximize_window()
driver.implicitly_wait(10)
driver.get("https://www.online.citibank.co.in/")
driver.find_element(By.XPATH,"//a[@class='newclose']").click()
driver.find_element(By.XPATH,"//a[@class='newclose2']").click()
driver.find_element(By.XPATH,"//span[text()='Login']").click()

print(driver.window_handles)
driver.switch_to.window(driver.window_handles[1])

driver.find_element(By.XPATH,"//div[contains(text(),'Forgot User ID')]").click()

driver.find_element(By.LINK_TEXT,"select your product type").click()
driver.find_element(By.LINK_TEXT,"Credit Card").click()
driver.find_element(By.ID,"citiCard1").send_keys("787")
driver.find_element(By.CSS_SELECTOR,"#citiCard2").send_keys("7872")
driver.find_element(By.CSS_SELECTOR,"#citiCard3").send_keys("7873")
driver.find_element(By.CSS_SELECTOR,"input[name='citiCard4']").send_keys("7873")
driver.find_element(By.ID,"cvvnumber").send_keys("787")

#approach 1 - not working
# driver.find_element(By.CSS_SELECTOR,"#bill-date-long").send_keys("08/04/1998")

#approach 2 - working
#click on calendar textbox
#select year
#select month
#click on 08
driver.find_element(By.CSS_SELECTOR,"#bill-date-long").click()

select_year=Select(driver.find_element(By.XPATH,"//select[@data-handler='selectYear']"))
select_year.select_by_visible_text("2000")

select_month=Select(driver.find_element(By.XPATH,"//select[@data-handler='selectMonth']"))
select_month.select_by_visible_text("Dec")

driver.find_element(By.LINK_TEXT,"8").click()

#approach 3 - javascript  - working
driver.execute_script("document.querySelector(\"#bill-date-long\").value='10/12/2000'")

#javascript with webelement
ele=driver.find_element(By.XPATH,"//input[@id='bill-date-long']")
driver.execute_script("arguments[0].value='10/12/2000'",ele)

time.sleep(5)
driver.quit()
