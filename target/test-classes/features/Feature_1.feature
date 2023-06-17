Feature: Scanning documents for employer registration

Scenario: Scanning officer uploads documents to the Document Management System
Given I am a scanning officer
And I have the registration documents to scan
When I scan the documents
And I upload them to the Document Management System
Then the documents should be associated with their corresponding Registration File number
And the documents should be uploaded to the appropriate folders
And I can use the 'other' folder if the document is not listed

@ValidCase
Scenario: Scanning supervisor reviews the entire employer registration file
Given I am a scanning supervisor
And the employer registration file is available for review
When I review the file
Then I can validate that each scanned document is associated to its corresponding Registration File number
And the entire employer registration file is available for review and approval

@ValidCase
Scenario: Scanning officer uploads partially uploaded file
Given I am a scanning officer
And I have partially uploaded employer registration file
When I scan and upload the remaining documents for the file
Then the documents should be associated with their corresponding Registration File number
And the documents should be uploaded to the appropriate folders
And the supervisor can be notified when the file is submitted

@ValidCase
Scenario: Scanning officer uploads documents for another file while a previous file was partially completed
Given I am a scanning officer
And I have partially uploaded employer registration file
When I start uploading documents for another file
Then the documents for the second file should be associated with their corresponding Registration File number
And the documents for the second file should be uploaded to the appropriate folders

@ValidCase
Scenario: Scanning supervisor is notified when file is submitted
Given I am a scanning officer
And I have uploaded employer registration file
When the file is submitted
Then the supervisor can be notified of the submission

@InvalidCase
Scenario: Scanning officer uploads document without corresponding Registration File number
Given I am a scanning officer
And I have a document to scan
When I upload the document to the Document Management System without corresponding Registration File number
Then the document should not be uploaded
And an error message should be displayed

@InvalidCase
Scenario: Scanning officer uploads document to inappropriate folder
Given I am a scanning officer
And I have a document to scan
When I upload the document to the inappropriate folder
Then the document should not be uploaded
And an error message should be displayed

@InvalidCase
Scenario: Scanning officer uploads document not in the document list without using 'other' folder
Given I am a scanning officer
And I have a document to scan
When I upload the document not in the document list without using 'other' folder
Then the document should not be uploaded
And an error message should be displayed