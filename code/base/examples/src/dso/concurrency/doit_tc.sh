java -Xbootclasspath/p:$JAVA_HOME/lib/dsojre.jar -classpath $TC_CLASSPATH -Dtc.home=/Users/dferguson/main/tc -Djava.system.class.loader=com.tc.object.bytecode.DSOClassLoader dso.concurrency.ConcurrencyTester 100 1 2
