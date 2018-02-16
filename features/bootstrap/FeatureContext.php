<?php

use Drupal\DrupalExtension\Context\DrushContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Behat\Tester\Exception\PendingException;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends DrushContext implements SnippetAcceptingContext {


  /**
   * Make MinkContext available.
   * @var \Drupal\DrupalExtension\Context\MinkContext
   */
  private $minkContext;

  /**
   * Prepare Contexts.
   * @BeforeScenario
   */
  public function gatherContexts(BeforeScenarioScope $scope)
  {
    $environment = $scope->getEnvironment();
    $this->minkContext = $environment->getContext('Drupal\DrupalExtension\Context\MinkContext');
  }

  /**
   * Log output and watchdog logs after any failed step.
   * @AfterStep
   */
  public function logAfterFailedStep($event)
  {
    if ($event->getTestResult()->getResultCode() === \Behat\Testwork\Tester\Result\TestResult::FAILED) {

      // Print Current URL and Last reponse after any step failure.
      echo "Step Failed.";

      echo "\nLasts Response:\n";
      $this->minkContext->printLastResponse();

      echo "\nWatchdog Errors:\n";
      $this->assertDrushCommand('wd-show');
      $this->printLastDrushOutput();

    }
  }

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct() {
  }

  /**
   * @AfterSuite
   */
  public static function cleanAegir() {
    exec('rm -rf /var/aegir/platforms/d6/sites/drupal6.local.computer');
    print "Removed /var/aegir/platforms/d6/sites/drupal6.local.computer";
  }

  /**
   * @When I select the radio button with the label :label
   *
   * @TODO: Remove when PR is merged: https://github.com/jhedstrom/drupalextension/pull/302
   */
  public function assertSelectRadioByName($label) {
    $element = $this->getSession()->getPage();

    $radiobutton = $element->find('named', array('radio', $this->getSession()->getSelectorsHandler()->xpathLiteral($label)));
    if ($radiobutton === NULL) {
      throw new \Exception(sprintf('The radio button with the label "%s" was not found on the page %s', $label, $this->getSession()->getCurrentUrl()));
    }
    $value = $radiobutton->getAttribute('value');
    $radiobutton->selectOption($value, FALSE);
  }
}
