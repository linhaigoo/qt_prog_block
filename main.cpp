#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QProcess>
#include "backend.h"
#include "black.h"
#include "QDebug"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    if (QString(argv[argc-1]) == "daemon")
    {
        HANDLE hpid = OpenProcess(PROCESS_ALL_ACCESS,false,atoi(argv[argc-2]));
        while(1)
        {
            Sleep(5000);
            DWORD ExitCode;
            GetExitCodeProcess(hpid,&ExitCode);
            if(STILL_ACTIVE != ExitCode)
            {
                QStringList arg = qApp->arguments();
                arg.pop_back();
                arg.pop_back();
                QProcess::startDetached(qApp->arguments()[0], arg);
                break;
            }
        }
    }
    else
    {
        qint64 CurPid = QCoreApplication::applicationPid();
        QStringList arg = qApp->arguments();
        arg.append(QString::number(CurPid));
        arg.append("daemon");
        qDebug()<<arg.back();
        QProcess::startDetached(qApp->arguments()[0], arg);

        autostart();

        qmlRegisterType<backend>("io.qt.backend", 1, 0, "BackEnd");

        QQmlApplicationEngine engine;
        engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
        if (engine.rootObjects().isEmpty())
            return -1;

        app.exec();
    }

    app.quit();   
}
