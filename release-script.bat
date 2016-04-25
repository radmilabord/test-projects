REM update all dependencies to the latest released version
call mvn versions:use-latest-versions -Dincludes=com.rada:* 
call mvn release:prepare -Dusername=radmilabord -Dpassword=pinelopa80
call mvn release:perform