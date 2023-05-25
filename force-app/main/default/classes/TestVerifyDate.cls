@isTest
public class TestVerifyDate {
    @isTest static void checkDate(){
        Date dt1 = Date.parse('10/05/2022');
        Date dt2 = Date.parse('20/05/2022');
        Date dt3 = Date.parse('21/05/2022');
        Date res = VerifyDate.CheckDates(dt1, dt2);
        System.assertEquals(Date.parse('20/05/2022'),res);
        res = VerifyDate.CheckDates(dt3, dt2);
        System.assertEquals(Date.parse('31/05/2022'),res);
    }
}