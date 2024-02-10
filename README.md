скрипты для создания локального репозитория Oracle Linux 

данные скрипты писались и проверялись на Oracle Linux v9


действия на сервере зеркала репозиториев :

1\ устанавливается ОС Oracle Linux v9 , устанавливайте nginx ,
монтируется дополнительный диск ~2000 ГБ ( в текущей конфигурации репозиториев ) в /usr/share/nginx/html/repos
в каталоге ../copy_rep_srv_mirror/conf.d есть минимальный конфигурационный файл repo.conf для nginx

2\ скрипты кладутся в каталог /root/mirror ,
если планируете в другое место , необходимо будет подправить пути в перменных скриптов 

3\ прописываете основной скрипт cron_upd_repo.sh в cron

4\ в каталоге /etc/yum.repos.d бэкапите и переименовываете все файлы , замещаете их файлами из каталога ../copy_rep_srv_mirror/yum.repos.d

5\ если на клиентах отключен Интернет необходимо сделать симлинк каталога /etc/pki/rpm-pgp в каталог /usr/share/nginx/html/repos ( см. п. 3 "клиент" ниже )

6\ регулировать кол-во репозиториев можно как в основном скрипте cron_upd_repo.sh так и гранулярно с помощью списков в каталоге ../list

7\ для информации , что выполняют ключи "--newest-only" и "--exclude="*.src"" можно обратиться к man reposync и man dnf (yum) соответственно
данные ключи также вынесеныв основном скрипте как переменные 


действия на клиенте для установки пакетов из локального репозитория :

1\ в каталоге /etc/yum.repos.d бэкапите и переименовываете все файлы , копируете из каталога ../copy_rep_client все файлы согласно версии дистрибутива

2\ проходитесь командой sed для выставления или имени сервера локального зеркала или IP сервера , пример :
sed -i 's/IP_OR_NAME/192.168.1.100/g' ./*.repo

3\ если на клиентах отсутствует Интернет , в файлах :
docker-ce.repo
nginx.repo
выставлены по умолчанию ключи "gpgkey=" , которые смотрят на локальный сервер ( см. п. 5 "Сервер" выше )
в других файлах *.repo также есть ключик "gpgkey=" , который смотрит в сторону сервера локального репозитория , по умолчанию он заремлен

4\
#yum clean all
#yum update
