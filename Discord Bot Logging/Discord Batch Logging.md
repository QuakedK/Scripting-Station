# Log your Batch file using a Discord Bot or Webhook.

# #1 Discord Webhook - (Easiest) 

**(Webhook Setup)**
1. Create your desired logging channel, then open the **settings** of that **channel** and go to **Integrations**. 
2. Then create, name and copy the **WebHook**.

**(Python Setup)**
1. Go to the [Python Website](https://www.python.org/downloads/), download the lastest version, check "**Add python.exe to PATH**" upon installation.
2. Once installed open **CMD** and type "**python --version**" if the version shows up you're good to go!
3. Now open **Notepad** and copy the **following code** ↓ naming it E.g. **logger_bot.py**
```Python
import requests

# Replace with your actual webhook URL
WEBHOOK_URL = 'https://discord.com/api/webhooks/your-webhook-id/your-webhook-token'

def send_log(message: str):
    payload = {
        "content": message  # You can also customize username or avatar_url if needed
    }

    response = requests.post(WEBHOOK_URL, json=payload)

    if response.status_code == 204:
        print("✅ Log sent successfully.")
    else:
        print(f"❌ Failed to send log. Status code: {response.status_code} - {response.text}")

# Example log message (replace with dynamic content if desired)
send_log("📝 UUID: Example_UUID ran Option 1.")
```
4. Now edit "**logger_bot.py**" or the **.py file** you created and change the **WEBHOOK_URL** with you copied one in discord.
5. Now open CMD and paste python "C:\...\...\logger_bot.py" (Replace Path with your Python Script Path).
6. If successful, you're discord bot should send the data to your desired discord channel.

**(Batch)**
> [!CAUTION]
> If the **logger_bot.py** is shared, others will have **access** to you're **discord bot**, etc. In order to prevent this you can try **encrypting the token, compiling an exe from the .py script or hosting a server cotaining the token privately**.
The **last option** in theory should be the **safest**, learn here **[Server hosting]()**.


1. Re-edit your "logger_bot.py" with the following. (Don't forget to replace Webhook)
```Python
import sys
import requests

# Replace with your actual webhook URL
WEBHOOK_URL = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_ID/YOUR_WEBHOOK_TOKEN'

def send_log(message: str):
    payload = {
        "content": message
    }

    response = requests.post(WEBHOOK_URL, json=payload)

    if response.status_code == 204:
        print("✅ Log sent successfully.")
    else:
        print(f"❌ Failed to send log. Status: {response.status_code} - {response.text}")

def main():
    try:
        UUID = sys.argv[1]
        User_Choice = sys.argv[2]
        send_log(f"📝 UUID `{UUID}` selected Option `{User_Choice}`.")
    except IndexError:
        send_log("⚠️ Log ran, but no UUID or option provided.")

if __name__ == "__main__":
    main()
```
2. Now lets create a batch that not only gets the UUID but also get the choice. (Python must be installed and don't forget to change the batch's path of the .py script)
```bat
@echo off
setlocal enabledelayedexpansion

:: UUID Detection/Creation.
set "UUID_FILE=UUID.txt"
if exist "%UUID_FILE%" (
    set /p UUID=<%UUID_FILE%
    echo Your UUID: !UUID!
) else (
    Powershell -NoProfile -Command "[guid]::NewGuid().ToString()" > %UUID_FILE%
    set /p UUID=<%UUID_FILE%
    echo Your UUID: !UUID!
)
echo.

:: Example Question.
echo Do you like Mommy Asmr?
echo.

:: User Choice (Asking the user options.)
:AskOption
echo Choose an option:
echo 1. Yes
echo 2. No
set /p option="Enter option number: "
echo.
if "%option%"=="1" (
set User_Choice=Yes
echo Great Answear!
call :Py_log 
) else if "%option%"=="2" (
set User_Choice=No
echo Bad Answear!
call :Py_log 
) else (
cls
chcp 437 >nul
powershell -Command "Write-Host 'Invalid choice, Please choose options 1-2.' -ForegroundColor White -BackgroundColor Red"
timeout 1 > nul
goto :AskOption
)
endlocal

:: Call Python script to send data. (Python must be installed or compile the .py into an exe and run it that way)
:Py_log
python "C:\MyProject\tools\send_log.py" !UUID! !User_Choice!
pause
```
3. Once done run the bat file and see if the bot responds!
