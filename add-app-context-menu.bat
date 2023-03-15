@echo off

@REM Mettez le nom de l'application pour pouvoir le retrouver dans REGEDIT plus facilement.
SET appName=Test

@REM Mettre le chemin absolue de l'application qui enmene a l'executable ( .exe )
@REM Faite une recherche de l'application concerné.
@REM Cliquer sur "Ouvrir l'emplacement du fichier"
@REM Clique droit sur l'executable souhaiter ( .exe ) puis appuyer sur "Copier en tant que chemin d'accés"
SET appPath=chemain_absolue

echo Ajout d'entrées dans un fichier
@reg add "HKEY_CLASSES_ROOT\*\shell\%appName%" /t REG_SZ /v "" /d "Ouvrir %appName%"   /f
@reg add "HKEY_CLASSES_ROOT\*\shell\%appName%" /t REG_EXPAND_SZ /v "Icon" /d "%appPath%,0" /f
@reg add "HKEY_CLASSES_ROOT\*\shell\%appName%\command" /t REG_SZ /v "" /d "%appPath% \"%%1\"" /f
 
echo Ajout d'entrées à l'intérieur d'un dossier
@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\%appName%" /t REG_SZ /v "" /d "Ouvrir avec %appName%"   /f
@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\%appName%" /t REG_EXPAND_SZ /v "Icon" /d "%appPath%,0" /f
@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\%appName%\command" /t REG_SZ /v "" /d "%appPath% \"%%V\"" /f

echo Ajout d'entrées dans un dossier
@reg add "HKEY_CLASSES_ROOT\Directory\shell\%appName%" /t REG_SZ /v "" /d "Ouvrir avec %appName%"   /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\%appName%" /t REG_EXPAND_SZ /v "Icon" /d "%appPath%,0" /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\%appName%\command" /t REG_SZ /v "" /d "%appPath% \"%%1\"" /f