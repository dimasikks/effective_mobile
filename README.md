# Запуск

**Все действия, выполнялись от root-пользователя**

Для того, чтобы скрипты сработали корректно необходимо выполнить следующее:


1. Склонировать репозиторий на свою машину:
```bash
git clone https://github.com/dimasikks/effective_mobile
```


2. Выдать необходимые права на скрипт, а также перемесить service файлы в /etc/systemd:
```bash
chmod +x test_monitoring.sh && mv test_monitoring.timer test_monitoring.service /etc/systemd/system/
```


3. Перезагружаем systemd и включаем таймер для автоматической работы:
```bash
systemctl daemon-reload && systemctl enable test_monitoring.timer && systemctl start test_monitoring.timer
```


4. Логи смотрим в /var/log/monitoring.log


**Работу выполнил Кашицын Дмитрий Сергеевич**
