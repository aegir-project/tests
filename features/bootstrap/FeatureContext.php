<?php

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Behat\Tester\Exception\PendingException;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {

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
