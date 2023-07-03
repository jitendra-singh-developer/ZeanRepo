public class AccountContactController {
	
     public static String getExecutableName() {
    String res;
    //Hello World
    //  Stacktrace will look like
    //  Class.someClassName.someMethodName: line/column
    //  Class.someClassName.someInnerClass.someMethodName: line/column
    //  ....    
    //  Trigger.someTriggername:
    //Hello This is my name --> Jagga ieurieuroeuoru  dfasdfasdfasdf
    try {Integer i = 10 / 0;}
    catch (Exception e) {
        System.debug('exception , '+ e.getStackTraceString());
        String[] lines = e.getStackTraceString().split('\n');
        for (Integer i = lines.size()-1; i >= 0; i--) {
            System.debug('loop ');
            if (lines[i].startsWith('AnonymousBlock:')) continue;       // in case invoked from anon apex
            if (lines[i].startsWith('Trigger.')){
                System.debug('check 1 ');
                return lines[i].subStringBetween('Trigger.',':');
            }
            else {      // could be Class.class.method or Class.outerclass.innerclass.method
                  System.debug('check 2');
                String candidate = lines[i].substringBetween('Class.',':');
                return candidate.substring(0,candidate.lastIndexOf('.')); 
            }   
        }
    } 
    return res;
} 
    
}