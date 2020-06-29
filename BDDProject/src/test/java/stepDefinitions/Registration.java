package stepDefinitions;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.Assert;

import BDDGroupIID.BDDArtifactID.TestRunnerTest;
import BDDGroupIID.BDDArtifactID.TestRunnerTestNG;
import cucumber.api.DataTable;
import cucumber.api.PendingException;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class Registration {
	public static int i;
	
	WebDriver driver= TestRunnerTestNG.getDriver();
	@Given("^your are in registraion page \"(.*?)\"$")
	public void your_are_in_registraion_page(String url) throws Throwable {
		// System.setProperty("webdriver.chrome.driver", "C:\\Users\\solomon\\workspace\\MyDrivers\\chromedriver.exe");
		driver.get(url);	
		//driver.findElement(By.linkText("REGISTER")).click();
				
	}

	@Given("^Add correct data to registration form (\\d+)$")
	public void add_correct_data_to_registration_form(Integer row, DataTable credencials) throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    // For automatic transformation, change DataTable to one of
	    // List<YourType>, List<List<E>>, List<Map<K,V>> or Map<K,V>.
	    // E,K,V must be a scalar (String, Integer, Date, enum etc)
		//List<List<String>> data = credencials.raw();
		//driver.findElement(By.name("lastName")).sendKeys(data.get(0).get(1));
		if(row >5 || row <=0) {
			row = 0;
		}else {
			row =row -1;

		}
		List<Map<String, String>> data = credencials.asMaps(String.class, String.class);
		driver.findElement(By.name("firstName")).sendKeys(data.get(row).get("firstName"));
		driver.findElement(By.name("lastName")).sendKeys(data.get(row).get("lastName"));
		driver.findElement(By.name("phone")).sendKeys(data.get(row).get("phone"));
		driver.findElement(By.name("userName")).sendKeys(data.get(row).get("email"));
		driver.findElement(By.name("address1")).sendKeys(data.get(row).get("address"));
		driver.findElement(By.name("city")).sendKeys(data.get(row).get("city"));
		driver.findElement(By.name("state")).sendKeys(data.get(row).get("state"));
		driver.findElement(By.name("postalCode")).sendKeys(data.get(row).get("postalCode"));
		driver.findElement(By.name("email")).sendKeys(data.get(row).get("userName"));
		
		
	}

	   // throw new PendingException();
	

	@When("^I insert password \"(.*?)\" and confirm password  \"(.*?)\"$")
	public void i_insert_password_and_confirm_password(String pass, String confirm) throws Throwable {
		driver.findElement(By.name("password")).sendKeys(pass);
		driver.findElement(By.name("confirmPassword")).sendKeys(confirm);
		takeScreenShot("BeforeSubmit");
	    //throw new PendingException();
	}

	@When("^I click submit$")
	public void i_click_submit() throws Throwable {
		driver.findElement(By.name("register")).click();
		// throw new PendingException();
	}

	@Then("^\"(.*?)\" page should be seen$")
	public void page_should_be_seen(String url) throws Throwable {
		try{
			takeScreenShot("AfterSubmit");
			Assert.assertTrue(driver.getCurrentUrl().contains(url));
			//driver.quit();
		}catch(Exception e){
			//driver.quit();

			Assert.fail();
		}
		
	    
	   // throw new PendingException();
	}
@After
public void test(){
	//driver.quit();
}
public void takeScreenShot(String when){
	JavascriptExecutor jse = (JavascriptExecutor)driver;
	jse.executeScript("window.scrollBy(0,250)", "");
	
	
	
	i++;
	File src= ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
	try {
	 // now copy the  screenshot to desired location using copyFile //method
	FileUtils.copyFile(src, new File("C:/selenium/" +  i + when + ".png"));
	}
	 
	catch (IOException e)
	 {
	  System.out.println(e.getMessage());
	 
	 }
}

}
