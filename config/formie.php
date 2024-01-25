<?php

return [
     '*' => [
        'pluginName' => 'Forms',
        'defaultPage' => 'submissions',

        // Forms
        'defaultFormTemplate' => '',
        'defaultEmailTemplate' => '',
        'enableUnloadWarning' => false,
        'enableBackSubmission' => true,
        'ajaxTimeout' => 10,

        // General Fields
        'disabledFields' => [],
        'defaultLabelPosition' => 'above-input',
        'defaultInstructionsPosition' => 'below-input',

        // Fields
        'defaultFileUploadVolume' => '',
        'defaultDateDisplayType' => '',
        'defaultDateValueOption' => '',
        'defaultDateTime' => '',

        // Submissions
        'maxIncompleteSubmissionAge' => 30,
        'enableCsrfValidationForGuests' => true,
        'useQueueForNotifications' => true,
        'useQueueForIntegrations' => true,
        'queuePriority' => null,

        // Sent Notifications
        'sentNotifications' => true,
        'maxSentNotificationsAge' => 30,

        // Spam
        'saveSpam' => true,
        'spamLimit' => 500,
        'spamEmailNotifications' => false,
        'spamBehaviour' => 'showSuccess',
        'spamKeywords' => '',
        'spamBehaviourMessage' => '',

        // Alerts
        'sendEmailAlerts' => false,
        'alertEmails' => [],

        'themeConfig' => [
          'resetClasses' => true,
  
          'formTitle' => [
              'attributes' => [
                  'class' => 'text_md font-medium text-primary-dark/80',
              ],
          ],
  
          'alertError' => [
              'attributes' => [
                  'class' => 'rounded-md bg-error/5 border border-error text_xs text-error p-4 mb-4',
              ],
          ],
  
          'alertSuccess' => [
              'attributes' => [
                  'class' => 'rounded-md bg-success/20 border border-success/80 text_xs text-success p-4 mb-4',
              ],
          ],
  
          'buttonWrapper' => [
              'attributes' => [
                  'class' => [
                      'flex justify-start -mx-2',
                      "{{ buttonsPosition == 'right' ? 'justify-end' }}",
                      "{{ buttonsPosition == 'center' ? 'justify-center' }}",
                      "{{ buttonsPosition == 'left-right' ? 'justify-between' }}",
                      "{{ buttonsPosition == 'right-save-left' ? 'justify-start flex-row-reverse' }}",
                      "{{ buttonsPosition == 'center-save-left' ? 'justify-center flex-row-reverse' }}",
                      "{{ buttonsPosition == 'center-save-right' ? 'justify-center' }}",
                      "{{ buttonsPosition == 'save-right' ? 'justify-between' }}",
                      "{{ buttonsPosition == 'save-left' ? 'justify-between flex-row-reverse' }}",
                  ],
              ],
          ],
  
          'buttonContainer' => [
              'attributes' => [
                  'class' => 'flex justify-start',
              ],
          ],
  
          'saveButton' => [
              'attributes' => [
                  'class' => [
                      'inline-flex items-center px-4 py-2 border border-transparent text_sm font-medium rounded-md text-accent hover:underline focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-accent',
                      'mx-2',
                  ],
              ],
          ],
  
          'backButton' => [
              'attributes' => [
                  'class' => [
                      'btn btn--secondary',
                      'mx-2',
                  ],
              ],
          ],
  
          'submitButton' => [
              'attributes' => [
                  'class' => [
                      'btn btn--accent',
                  ],
              ],
          ],
  
          'page' => [
              'attributes' => [
                  'class' => [
                      "{{ form.hasMultiplePages() and page.id != currentPage.id ? 'hidden' : false }}",
                  ],
              ],
          ],
  
          'pageTabs' => [
              'attributes' => [
                  'class' => 'border-b border-gray-200 -mb-px flex space-x-8 mb-6',
              ],
          ],
  
          'pageTab' => [
              'attributes' => [
                  'class' => 'py-4 px-1',
              ],
          ],
  
          'pageTabLink' => [
              'attributes' => [
                  'class' => [
                      'whitespace-nowrap py-4 px-1 border-b-2 font-medium text_xs',
                      "{{ (page.id == currentPage.id) ? 'border-accent text-accent' : 'border-transparent text-primary-dark hover:text-primary-secondary/80 hover:border-accent/80' }}",
                      "{{ page.getFieldErrors(submission) ? 'text-error' : false }}",
                  ],
              ],
          ],
  
          'pageTitle' => [
              'attributes' => [
                  'class' => 'text_lg font-medium text-primary-dark mb-4',
              ],
          ],
  
          'progress' => [
              'attributes' => [
                  'class' => 'flex h-[1.2rem] text_sm text-white bg-slate-200 mt-4',
              ],
          ],
  
          'progressContainer' => [
              'attributes' => [
                  'class' => 'flex flex-col justify-center text-center font-medium bg-accent',
              ],
          ],
  
          'subFieldRow' => [
              'attributes' => [
                  'class' => 'flex flex-wrap -mx-4 mb-4 last:mb-0',
              ],
          ],
  
          'nestedFieldRows' => [
              'attributes' => [
                  'class' => 'border py-4',
              ],
          ],
  
          'nestedFieldRow' => [
              'attributes' => [
                  'class' => 'flex flex-wrap mb-4 last:mb-0',
              ],
          ],
  
          'row' => [
              'attributes' => [
                  'class' => [
                      'flex flex-wrap -mx-4 mb-4',
                      "{{ not craft.formie.getVisibleFields(row) ? 'hidden' }}",
                  ],
              ],
          ],
  
          'field' => [
              'attributes' => [
                  'class' => 'px-4 flex-1',
              ],
          ],
  
          'fieldLabel' => [
              'attributes' => [
                  'class' => 'mb-1 block text_sm font-medium text-secondary-dark/80',
              ],
          ],
  
          'fieldRequired' => [
              'attributes' => [
                  'class' => 'text-error',
              ],
          ],
  
          'fieldInstructions' => [
              'attributes' => [
                  'class' => 'mb-1 text_sm text-secondary-dark/60',
              ],
          ],
  
          'fieldInput' => [
              'attributes' => [
                  'class' => [
                      'shadow-sm focus:ring-accent/80 focus:border-accent/80 block w-full sm:text_sm border-secondary-dark/60 rounded-md',
                      "{{ (submission.getErrors(field.handle) ?? null) ? 'border-error' }}",
                  ],
              ],
          ],
  
          'fieldError' => [
              'attributes' => [
                  'class' => 'text-error text_sm mt-1',
              ],
          ],
  
          'fieldAddButton' => [
              'attributes' => [
                  'class' => 'btn btn--secondary',
              ],
          ],
  
          'fieldRemoveButton' => [
              'attributes' => [
                  'class' => 'btn btn--secondary',
              ],
          ],
  
          'fieldLimit' => [
              'attributes' => [
                  'class' => 'mt-2 text_sm text-secondary/80',
              ],
          ],
  
          'agree' => [
              'fieldOption' => [
                  'attributes' => [
                      'class' => 'flex items-start mb-2',
                  ],
              ],
  
              'fieldOptionLabel' => [
                  'attributes' => [
                      'class' => 'ml-2 text_sm',
                  ],
              ],
  
              'fieldInput' => [
                  'resetClass' => true,
  
                  'attributes' => [
                      'class' => 'focus:ring-accent/80 h-4 w-4 text-accent/60 border-gray-300 rounded',
                  ],
              ],
          ],
  
          'checkboxes' => [
              'fieldOption' => [
                  'attributes' => [
                      'class' => 'flex items-start mb-2',
                  ],
              ],
  
              'fieldOptionLabel' => [
                  'attributes' => [
                      'class' => 'ml-2 text_sm',
                  ],
              ],
  
              'fieldInput' => [
                  'resetClass' => true,
  
                  'attributes' => [
                      'class' => 'focus:ring-accent h-4 w-4 text-accent border-gray-300 rounded',
                  ],
              ],
          ],
  
          'dropdown' => [
              'fieldInput' => [
                  'resetClass' => true,
  
                  'attributes' => [
                      'class' => 'shadow-sm focus:ring-accent focus:border-accent block w-full sm:text_sm border-gray-300 rounded-md',
                  ],
              ],
          ],
  
          'hiddenField' => [
              'field' => [
                  'resetClass' => true,
  
                  'attributes' => [
                      'class' => 'hidden',
                  ],
              ],
          ],
  
          'radioButtons' => [
              'fieldOption' => [
                  'attributes' => [
                      'class' => 'flex items-start mb-2',
                  ],
              ],
  
              'fieldOptionLabel' => [
                  'attributes' => [
                      'class' => 'ml-2 text_sm',
                  ],
              ],
  
              'fieldInput' => [
                  'resetClass' => true,
  
                  'attributes' => [
                      'class' => 'focus:ring-accent h-4 w-4 text-accent border-gray-300',
                  ],
              ],
          ],
  
          'recipients' => [
              'field' => [
                  'attributes' => [
                      'class' => [
                          "{{ field.getIsHidden() ? 'hidden' : false }}",
                      ],
                  ],
              ],
          ],
  
          'repeater' => [
              'nestedField' => [
                  'attributes' => [
                      'class' => 'relative',
                  ],
              ],
  
              'nestedFieldWrapper' => [
                  'attributes' => [
                      'class' => 'mb-4',
                  ],
              ],
  
              'fieldRemoveButton' => [
                  'attributes' => [
                      'class' => 'btn btn--secondary',
                  ],
              ],
          ],
  
          'signature' => [
              'fieldInputContainer' => [
                  'attributes' => [
                      'class' => 'relative',
                  ],
              ],
  
              'fieldCanvas' => [
                  'attributes' => [
                      'class' => 'w-full h-[8rem] border bg-slate-100',
                  ],
              ],
  
              'fieldRemoveButton' => [
                  'attributes' => [
                      'class' => 'btn btn--secondary',
                  ],
              ],
          ],
  
          'table' => [
              'fieldTable' => [
                  'attributes' => [
                      'class' => 'min-w-full divide-y divide-gray-300',
                  ],
              ],
  
              'fieldTableHeaderColumn' => [
                  'attributes' => [
                      'class' => 'px-3 py-3.5 text-left text_sm font-semibold text-secondary-dark',
                  ],
              ],
  
              'fieldTableBody' => [
                  'attributes' => [
                      'class' => 'divide-y divide-gray-200 bg-white',
                  ],
              ],
  
              'fieldTableBodyColumn' => [
                  'attributes' => [
                      'class' => 'whitespace-nowrap px-3 py-4 text_sm text-secondary-dark/60',
                  ],
              ],
          ],
      ],
    ]
];