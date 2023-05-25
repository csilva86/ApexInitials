@isTest
public class TestRestrictContactByName {
    @isTest static void TestRestrictContactCreation(){
        // Test data setup
        // Creating a Contact
        Contact ctt = new Contact(
        	FirstName = 'Elvis',
        	LastName = 'INVALIDNAME');
        
        Test.startTest();
        insert ctt;
        Test.stopTest();
        
    }
}